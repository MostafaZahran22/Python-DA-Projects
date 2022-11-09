import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import squarify


def update_columns():
    calendar_df['Date']=pd.to_datetime(calendar_df['Date'])
    Sales['OrderDate']=pd.to_datetime(Sales['OrderDate'])
    Returns_df['ReturnDate']=pd.to_datetime(Returns_df['ReturnDate'])
    customer_df['FullName']=customer_df['Prefix']+' '+customer_df['FirstName']+' '+customer_df['LastName']


def category_subcat_orders():
    DF=pd.merge(left=Sales,right=product_df[['ProductKey','ProductPrice','ProductSubcategoryKey']],on='ProductKey')
    cat_sub=pd.merge(left=product_sub_cat_df,right=product_cat_df,on='ProductCategoryKey')
    DF=pd.merge(left=DF,right=cat_sub,on='ProductSubcategoryKey')
    cat_GP=DF.groupby(['CategoryName']).agg({'OrderNumber':pd.Series.nunique}).reset_index()
    print(cat_GP)
    fig=plt.figure(figsize=(5,5))
    axis=sns.barplot(cat_GP,x='CategoryName',y='OrderNumber')
    axis.set_title('Categories Orders Quantity')
    sub_GP=DF.groupby(['SubcategoryName']).agg({'OrderNumber':pd.Series.nunique}).sort_values(by=['OrderNumber'],ascending=False).reset_index()
    sub_GP=sub_GP[:5]
    print(sub_GP)
    labels=list()
    for index,row in sub_GP.iterrows():labels.append(row['SubcategoryName']+'\n'+str(row['OrderNumber']))
    plt.figure(figsize=(7,6))
    plt.title('Top 5 SubCategories in Orders Quantity')
    squarify.plot(sizes=sub_GP['OrderNumber'],label=labels,pad=2,alpha=0.8)
    plt.axis('off')


def top_5_prod_rev():
    DF=pd.merge(left=product_df,right=Sales,on='ProductKey')
    DF['Total Revenue']=DF['ProductPrice']*DF['OrderQuantity']
    GP=DF.groupby(['ProductName']).sum()[['Total Revenue']].sort_values(by='Total Revenue',ascending=False).reset_index()
    GP=GP[:5]
    print(GP)
    labels=list()
    for index,row in GP.iterrows():labels.append(row['ProductName']+'\n'+str(round(row['Total Revenue'],2))+'$')
    plt.figure(figsize=(7,5))
    plt.title('Top 5 Products in Revenue')
    squarify.plot(sizes=GP['Total Revenue'],label=labels,pad=2,alpha=0.8)
    plt.axis('off')


def quantity_sold_by_month():
    DF=pd.merge(left=Sales,right=calendar_df,left_on='OrderDate',right_on='Date')
    GP=DF.groupby(pd.Grouper(key='Date',freq='M')).sum()[['OrderQuantity']].reset_index()
    print(GP)
    fig=plt.figure(figsize=(8,5))
    axis=sns.lineplot(GP,x='Date',y='OrderQuantity')
    axis.set_title('Quantity Sold Per Month')
    axis.tick_params(axis='x', rotation=15)


def prod_return_rate():
    DF1=pd.merge(left=Returns_df,right=product_df[['ProductName','ProductKey']],on='ProductKey')
    DF2 = pd.merge(left=product_df[['ProductName','ProductKey']], right=Sales, on='ProductKey')
    GP1=DF1.groupby(['ProductName']).sum()[['ReturnQuantity']].reset_index()
    GP2=DF2.groupby(['ProductName']).sum()[['OrderQuantity']].reset_index()
    ord_ret_df=pd.merge(left=GP2,right=GP1,on='ProductName')
    ord_ret_df['Return Rate']=round(ord_ret_df['ReturnQuantity']/ord_ret_df['OrderQuantity']*100,2)
    ord_ret_df.sort_values(by=['Return Rate'],inplace=True,ascending=False)
    ord_ret_df['Return Rate']=ord_ret_df['Return Rate'].astype(str)+'%'
    #print(ord_ret_df)
    fig,ax=plt.subplots()
    fig.set_figheight(5)
    ax.set_title('Top 10 Products in Return Rate')
    table=ax.table(cellText=ord_ret_df[:10].values,colLabels=ord_ret_df.columns,loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(ord_ret_df.columns))))
    table.scale(0.5, 1.7)
    ax.axis('off')
    fig.tight_layout()


def top_bottom_5_cust_rev():
    DF=pd.merge(left=Sales,right=product_df[['ProductKey','ProductPrice']],on='ProductKey')
    DF['Total Revenue'] = DF['ProductPrice'] * DF['OrderQuantity']
    DF=DF.groupby(['CustomerKey']).sum()[['Total Revenue']].reset_index()
    DF=pd.merge(right=DF,left=customer_df[['CustomerKey','FullName']],on='CustomerKey')
    DF.sort_values(by='Total Revenue',ascending=False,inplace=True)
    DF.drop(columns=['CustomerKey'],inplace=True)
    DF['Total Revenue']=round(DF['Total Revenue'],2)
    print(DF)
    ###############################
    # Top Customers Table
    fig, ax = plt.subplots()
    fig.set_figheight(5)
    ax.set_title('Top 5 Customers in Revenue')
    table = ax.table(cellText=DF[:5].values, colLabels=DF.columns, loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(DF.columns))))
    table.scale(0.5, 1.7)
    ax.axis('off')
    fig.tight_layout()
    #################################
    # Bottom Customers Table
    fig2, ax2 = plt.subplots()
    fig2.set_figheight(5)
    ax2.set_title('Bottom 5 Customers in Revenue')
    table2 = ax2.table(cellText=DF[-5:].values, colLabels=DF.columns, loc='center')
    table2.auto_set_font_size(False)
    table2.set_fontsize(10)
    table2.auto_set_column_width(col=list(range(len(DF.columns))))
    table2.scale(0.5, 1.7)
    ax2.axis('off')
    fig2.tight_layout()


def country_profit():
    DF=pd.merge(left=Sales,right=product_df[['ProductKey','ProductPrice','ProductCost']],on='ProductKey')
    DF['Total Revenue']=DF['ProductPrice']*DF['OrderQuantity']
    DF['Total Cost']=DF['ProductCost']*DF['OrderQuantity']
    DF['Profit']=DF['Total Revenue']-DF['Total Cost']
    DF=pd.merge(left=DF,right=territories_df,left_on='TerritoryKey',right_on='SalesTerritoryKey')
    GP=DF.groupby(['Country']).sum()[['Profit']].reset_index()
    GP.sort_values(by=['Profit'],inplace=True,ascending=False)
    GP['Profit'] = round(GP['Profit'],2)
    print(GP)
    fig=plt.figure(figsize=(8,6))
    axis=sns.barplot(GP,x='Profit',y='Country')
    axis.set_title('Countries Profit')
    axis.set_yticklabels(axis.get_yticklabels(), fontsize=8, rotation=15)


def category_rev():
    DF=pd.merge(left=product_cat_df,right=product_sub_cat_df[['ProductSubcategoryKey','ProductCategoryKey']],on='ProductCategoryKey')
    #print(DF)
    DF=pd.merge(left=DF,right=product_df[['ProductKey','ProductSubcategoryKey','ProductPrice']],on='ProductSubcategoryKey')
    #print(DF)
    DF=pd.merge(left=DF[['ProductKey','CategoryName','ProductPrice']],right=Sales[['ProductKey','OrderQuantity']],on='ProductKey')
    #print(DF)
    DF['Total Revenue']=DF['ProductPrice']*DF['OrderQuantity']
    GP=DF.groupby(['CategoryName']).sum()[['Total Revenue']].sort_values(by=['Total Revenue'],ascending=False).reset_index()
    GP['Total Revenue']=round(GP['Total Revenue'],2).astype(str)+'$'
    print(GP)
    fig,axis=plt.subplots()
    axis.set_title('Categories Revenue')
    table=axis.table(cellText=GP.values, colLabels=GP.columns, loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(GP.columns))))
    table.scale(0.5, 1.7)
    axis.axis('off')
    fig.tight_layout()


def monthly_profit():
    DF=pd.merge(left=Sales,right=calendar_df,left_on='OrderDate',right_on='Date')
    DF=pd.merge(left=DF,right=product_df[['ProductKey','ProductPrice','ProductCost']],on='ProductKey')
    DF['Total Revenue']=DF['ProductPrice']*DF['OrderQuantity']
    DF['Total Cost']=DF['ProductCost']*DF['OrderQuantity']
    DF['Profit']=DF['Total Revenue']-DF['Total Cost']
    GP=DF.groupby(pd.Grouper(key='Date',freq='M')).sum()['Profit'].reset_index()
    print(GP)
    fig=plt.figure(figsize=(8,5))
    ax=sns.lineplot(GP,x='Date',y='Profit')
    ax.set_title('Monthly Profit')
    ax.tick_params(axis='x', rotation=15)

if __name__=='__main__':
    customer_df = pd.read_csv('AdventureWorks_Customers.csv', encoding="ISO-8859-1")
    calendar_df = pd.read_csv('AdventureWorks_Calendar.csv')
    product_cat_df = pd.read_csv('AdventureWorks_Product_Categories.csv')
    product_sub_cat_df = pd.read_csv('AdventureWorks_Product_Subcategories.csv')
    product_df = pd.read_csv('AdventureWorks_Products.csv')
    territories_df = pd.read_csv('AdventureWorks_Territories.csv')
    Sales2015 = pd.read_csv('AdventureWorks_Sales_2015.csv')
    Sales2016 = pd.read_csv('AdventureWorks_Sales_2016.csv')
    Sales2017 = pd.read_csv('AdventureWorks_Sales_2017.csv')
    Sales=pd.concat([Sales2015,Sales2016,Sales2017])
    Returns_df = pd.read_csv('AdventureWorks_Returns.csv')
    update_columns()
    category_subcat_orders()
    top_5_prod_rev()
    quantity_sold_by_month()
    prod_return_rate()
    top_bottom_5_cust_rev()
    country_profit()
    category_rev()
    monthly_profit()
    plt.show()