import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import squarify
import numpy as np

def Month(s):
    month_dic = {"January": "Jan", "February": "Feb", "March": "Mar", "April": "Apr", "May": "May", "June": "Jun",
                 "July": "Jul", "August": "Aug", "September": "Sep", "October": "Oct", "November": "Nov",
                 "December": "Dec"}
    return month_dic[s]


def col_update():
    Transactions_df['transaction_date'] = pd.to_datetime(Transactions_df['transaction_date'])
    Transactions_df['stock_date'] = pd.to_datetime(Transactions_df['stock_date'])
    Transactions_df['Days_In_Stock']=Transactions_df['transaction_date']-Transactions_df['stock_date']
    calender_df['date']=pd.to_datetime(calender_df['date'])
    Returns_df.rename(columns={'quantity':'quantity_returned'},inplace=True)
    Transactions_df.rename(columns={'quantity':'quantity_sold'},inplace=True)
    customer_df['full_name']=customer_df['first_name']+' '+customer_df['last_name']


def region_returns():
    DF=pd.merge(left=region_df,right=store_df[['region_id','store_id']],on='region_id')
    DF=pd.merge(left=DF,right=Returns_df,on='store_id')
    GP=DF.groupby(['sales_region']).sum()[['quantity_returned']].sort_values(by=['quantity_returned'],ascending=False).reset_index()
    #print(GP)
    labels=list()
    for index,row in GP.iterrows():labels.append(row['sales_region']+'\n'+str(row['quantity_returned']))
    fig=plt.figure(figsize=(8,6))
    plt.title('Returns By Region')
    squarify.plot(sizes=GP['quantity_returned'],label=labels,pad=1,alpha=0.8)
    plt.axis('off')


def avg_days_in_stock():
    print('Average Days in Stock is ',end='')
    print(Transactions_df['Days_In_Stock'].mean().days+1)


def quantity_by_month():
    DF=Transactions_df
    DF['Month Number']=DF['transaction_date'].dt.month
    DF['Month Name']=DF['transaction_date'].dt.month_name()
    GP=DF.groupby(['Month Name','Month Number']).sum()[['quantity_sold']].sort_values(by='Month Number').reset_index()
    print(GP)
    fig=plt.figure(figsize=(7,5))
    ax=sns.lineplot(data=GP,x=map(Month,GP['Month Name']),y='quantity_sold')


def gender_profit():
    DF=pd.merge(left=Transactions_df,right=product_df[['product_id','product_retail_price','product_cost']],on='product_id')
    DF['Total Revenue']=DF['product_retail_price']*DF['quantity_sold']
    DF['Total Cost']=DF['product_cost']*DF['quantity_sold']
    DF['Profit']=DF['Total Revenue']-DF['Total Cost']
    DF=pd.merge(left=DF,right=customer_df[['customer_id','gender']],on='customer_id')
    GP=DF.groupby(['gender']).sum()['Profit'].reset_index()
    print(GP)
    GP.plot(kind='pie',y='Profit',labels=GP['gender'],autopct='%1.0f%%',title="Profit By Gender",legend=False,colors=['pink','royalblue'])


def top_stores_sales_and_returns():
    saledf=pd.merge(left=store_df,right=Transactions_df,on='store_id')
    retdf=pd.merge(left=store_df,right=Returns_df,on='store_id')
    saleGP=saledf.groupby(['store_name']).sum()[['quantity_sold']].sort_values(by=['quantity_sold'],ascending=False).reset_index()
    retGP=retdf.groupby(['store_name']).sum()[['quantity_returned']].sort_values(by=['quantity_returned'],ascending=False).reset_index()
    print(saleGP)
    print(retGP)
    ###############################
    # Top Stores In Sales
    fig, ax = plt.subplots()
    fig.set_figheight(5)
    ax.set_title('Top Stores In Sales')
    table = ax.table(cellText=saleGP[:5].values, colLabels=saleGP.columns, loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(saleGP.columns))))
    table.scale(0.5, 1.7)
    ax.axis('off')
    fig.tight_layout()
    #################################
    # Top Stores In Returns
    fig2, ax2 = plt.subplots()
    fig2.set_figheight(5)
    ax2.set_title('Top Stores In Returns')
    table2 = ax2.table(cellText=retGP[:5].values, colLabels=retGP.columns, loc='center')
    table2.auto_set_font_size(False)
    table2.set_fontsize(10)
    table2.auto_set_column_width(col=list(range(len(retGP.columns))))
    table2.scale(0.5, 1.7)
    ax2.axis('off')
    fig2.tight_layout()


def prod_brand_profit():
    DF=pd.merge(left=Transactions_df,right=product_df,on='product_id')
    DF['Total Revenue']=DF['quantity_sold']*DF['product_retail_price']
    DF['Total Cost']=DF['quantity_sold']*DF['product_cost']
    DF['Profit']=DF['Total Revenue']-DF['Total Cost']
    GP=DF.groupby(['product_brand']).sum()[['Profit','Total Cost']].sort_values(by=['Profit'],ascending=False).reset_index()
    print(GP)


def education_profit_and_quantity():
    DF=pd.merge(left=Transactions_df,right=product_df[['product_id','product_retail_price','product_cost']],on='product_id')
    DF['Total Revenue'] = DF['quantity_sold'] * DF['product_retail_price']
    DF['Total Cost'] = DF['quantity_sold'] * DF['product_cost']
    DF['Profit'] = DF['Total Revenue'] - DF['Total Cost']
    DF=pd.merge(left=DF,right=customer_df[['customer_id','education']],on='customer_id')
    GP=DF.groupby(['education']).agg({'Profit':np.sum,'customer_id':pd.Series.nunique}).reset_index()
    print(GP)


def country_and_region_returns():
    DF=pd.merge(left=region_df,right=store_df[['region_id','store_id','store_country']],on='region_id')
    DF=pd.merge(left=DF,right=Returns_df,on='store_id')
    #print(DF.info())
    region_GP=DF.groupby(['sales_region']).sum()['quantity_returned'].reset_index()
    print(region_GP)
    country_GP=DF.groupby(['store_country']).sum()['quantity_returned'].reset_index()
    print(country_GP)


def store_type_profit():
    DF=pd.merge(left=Transactions_df,right=product_df[['product_id','product_retail_price','product_cost']],on='product_id')
    DF['Total Revenue']=DF['product_retail_price']*DF['quantity_sold']
    DF['Total Cost']=DF['product_cost']*DF['quantity_sold']
    DF['Profit']=DF['Total Revenue']-DF['Total Cost']
    DF=pd.merge(left=DF,right=store_df[['store_id','store_type']],on='store_id')
    GP=DF.groupby(['store_type']).sum()[['Profit']].sort_values(by=['Profit'],ascending=False).reset_index()
    print(GP)
    fig=plt.figure(figsize=(7,6))
    axis=sns.barplot(GP,x='Profit',y='store_type')
    axis.set_title('Profit By Store Type')
    axis.set_yticklabels(axis.get_yticklabels(), fontsize=7, rotation=17)


def top_15_cust_in_prof():
    DF=pd.merge(left=Transactions_df,right=product_df[['product_id','product_retail_price','product_cost']],on='product_id')
    DF['Total Revenue']=DF['product_retail_price']*DF['quantity_sold']
    DF['Total Cost']=DF['product_cost']*DF['quantity_sold']
    DF['Profit']=DF['Total Revenue']-DF['Total Cost']
    DF=pd.merge(left=DF,right=customer_df[['customer_id','full_name']],on='customer_id')
    GP=DF.groupby(['full_name']).sum()[['Profit']].sort_values(by='Profit',ascending=False).reset_index()
    print(GP)
    ##########################
    # Top 15 Customers in Profit
    fig, ax = plt.subplots()
    fig.set_figheight(7)
    ax.set_title('Top 15 Customers in Profit')
    GP['Profit']=round(GP['Profit'],2)
    table = ax.table(cellText=GP[:15].values, colLabels=GP.columns, loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(GP.columns))))
    table.scale(0.5, 1.7)
    ax.axis('off')
    fig.tight_layout()


def brands_returns():
    DF=pd.merge(left=product_df,right=Returns_df,on='product_id')
    GP=DF.groupby(['product_brand']).sum()[['quantity_returned']].sort_values(by=['quantity_returned'],ascending=False).reset_index()
    top_5=GP[:5]
    bottom_5=GP[-5:]
    print(top_5)
    print(bottom_5)


def count_lowfat_rec_prod():
    rec_count=product_df[['recyclable']].value_counts().iloc[0]
    low_fat_count=product_df[['low_fat']].value_counts().iloc[0]
    print("Number of Recyclable Products = ",rec_count)
    print("Number of Low Fat Products = ",low_fat_count)

if __name__=='__main__':
    calender_df = pd.read_csv('MavenMarket_Calendar.csv')
    customer_df = pd.read_csv('MavenMarket_Customers.csv')
    product_df = pd.read_csv('MavenMarket_Products.csv')
    region_df = pd.read_csv('MavenMarket_Regions.csv')
    store_df = pd.read_csv('MavenMarket_Stores.csv')
    Returns_df = pd.read_csv('MavenMarket_Returns_1997-1998.csv')
    trans1 = pd.read_csv('MavenMarket_Transactions_1997.csv')
    trans2 = pd.read_csv('MavenMarket_Transactions_1998.csv')
    Transactions_df = pd.concat([trans1,trans2])
    col_update()
    region_returns()
    avg_days_in_stock()
    quantity_by_month()
    gender_profit()
    top_stores_sales_and_returns()
    prod_brand_profit()
    education_profit_and_quantity()
    country_and_region_returns()
    store_type_profit()
    top_15_cust_in_prof()
    brands_returns()
    count_lowfat_rec_prod()
    plt.show()