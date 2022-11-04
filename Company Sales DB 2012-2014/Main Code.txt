from mysql import connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import squarify
import plotly.express as ex
import plotly.io as pio

def update_cols():
    product_df.rename(columns={'Id':'ProductId'},inplace=True)
    orders_df.rename(columns={'Id': 'OrderId'}, inplace=True)
    supplier_df.rename(columns={'Id': 'SupplierId'}, inplace=True)
    customer_df.rename(columns={'Id': 'CustomerId'}, inplace=True)
    orderitem_df.rename(columns={'Id': 'OrderItemId'}, inplace=True)
    new_date=list()
    for index,row in orders_df.iterrows():
        lst=row['OrderDate'].split()
        lst.pop()
        lst[0]=month_dic[lst[0]]
        S=lst[0]+'/'+lst[1]+'/'+lst[2]
        new_date.append(S)
    orders_df['OrderDate']=new_date
    orders_df['OrderDate']=pd.to_datetime(orders_df['OrderDate'])


def add_cols():
    orderitem_df['Total Revenue']=orderitem_df['Quantity']*orderitem_df['UnitPrice']
    orders_df['Month Name']=orders_df['OrderDate'].dt.month_name()
    orders_df['Month Number']=orders_df['OrderDate'].dt.month
    orders_df['Day Name']=orders_df['OrderDate'].dt.day_name()
    customer_df['FullName']=customer_df['FirstName']+' '+customer_df['LastName']


def top_bottom_10_prod_ev():
    prod_ord_df=pd.merge(left=orderitem_df,right=product_df,how='inner',on='ProductId')
    GP=prod_ord_df.groupby(['ProductName']).sum()['Total Revenue'].reset_index()
    GP.sort_values(by=['Total Revenue'],inplace=True,ascending=False)
    top10_fig=plt.figure(figsize=(12,5))
    top10_axis=sns.barplot(data=GP[:10],x='Total Revenue',y='ProductName')
    top10_axis.set_title('Top 10 Products In Revenue')
    top10_axis.set_yticklabels(top10_axis.get_yticklabels(), fontsize=8, rotation=15)
    bottom10_fig=plt.figure(figsize=(12,5))
    bottom10_axis=sns.barplot(data=GP[-10:],x='Total Revenue',y='ProductName')
    bottom10_axis.set_title('Bottom 10 Products In Revenue')
    bottom10_axis.set_yticklabels(bottom10_axis.get_yticklabels(),fontsize=8,rotation=15)


def top_3_prod_quantity_per_month():
    DF=pd.merge(left=orderitem_df,right=product_df,how='inner',on='ProductId')
    DF=pd.merge(left=DF,right=orders_df,how='inner',on='OrderId')
    #print(DF.info())
    GP=DF.groupby(['Month Name','Month Number','ProductName']).sum()['Quantity'].reset_index()
    GP.sort_values(by=['Month Number'],inplace=True,ascending=True)
    top_prod=DF.groupby(['ProductName']).sum()['Quantity'].reset_index()
    top_prod.sort_values(by=['Quantity'],inplace=True,ascending=False)
    top_prod=top_prod[:3]
    tplst=list(top_prod['ProductName'])
    #print(GP)
    #print(tplst)
    GP=GP.query(" ProductName == @tplst ")
    #print(GP)
    fig=plt.figure(figsize=(10,5))
    axis=sns.lineplot(GP,x='Month Name',y='Quantity',hue='ProductName')
    axis.set_title('Top 3 Products in Quantity Per Month')
    axis.set_xticklabels(["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"])


def top_10_suppliers_in_prod_rev():
    DF=pd.merge(left=orderitem_df,right=product_df,how='inner',on='ProductId')
    DF=pd.merge(left=DF,right=supplier_df,how='inner',on='SupplierId')
    print(DF.info())
    GP=DF.groupby(['CompanyName']).sum()['Total Revenue'].reset_index()
    GP.sort_values(by=['Total Revenue'],inplace=True,ascending=False)
    GP=GP.reset_index()
    GP=GP[:10]
    GP['Total Revenue']=round(GP['Total Revenue'],2)
    print(GP)
    labels=list()
    for index,row in GP.iterrows():
        labels.append(row['CompanyName']+'\n'+str(row['Total Revenue'])+'$')
    plt.figure(figsize=(9, 5))
    plt.title('Top 10 Suppliers in Products Revenue')
    squarify.plot(sizes=GP['Total Revenue'], label=labels, alpha=.8,pad=2,text_kwargs={'fontsize':8})
    plt.axis('off')


def top_10_customers_in_rev():
    DF=pd.merge(left=orders_df,right=customer_df,how='inner',on='CustomerId')
    DF=pd.merge(left=orderitem_df,right=DF,how='inner',on='OrderId')
    GP=DF.groupby(['FullName']).sum()['Total Revenue'].reset_index()
    GP.sort_values(by=['Total Revenue'], inplace=True, ascending=False)
    GP=GP[:10].reset_index()
    print(GP)
    fig=plt.figure(figsize=(8,6))
    axis=sns.barplot(GP,x='Total Revenue',y='FullName')
    axis.set_title('Top 10 Customers in Revenue')
    axis.set_yticklabels(axis.get_yticklabels(), fontsize=8, rotation=15)


def top_5_cities_in_quantity():
    DF=pd.merge(left=customer_df,right=orders_df,how='inner',on='CustomerId')
    DF=pd.merge(left=DF,right=orderitem_df,how='inner',on='OrderId')
    #print(DF.info())
    GP=DF.groupby(['City']).sum()['Quantity'].reset_index()
    GP.sort_values(by=['Quantity'],inplace=True,ascending=False)
    GP=GP[:10]
    print(GP)
    fig=plt.figure(figsize=(7,5))
    plt.title('Top 5 Cities in Quantity sold')
    labels=list()
    for index,row in GP.iterrows():
        labels.append(row['City']+'\n'+str(row['Quantity'])+'$')
    squarify.plot(sizes=GP['Quantity'],label=labels,alpha=.8,pad=2,text_kwargs={'fontsize':8})
    plt.axis('off')


def actual_vs_target_rev():
    DF=pd.merge(left=orderitem_df,right=orders_df,how='inner',on='OrderId')
    GP=DF.groupby(pd.Grouper(key='OrderDate',freq='M')).sum()['Total Revenue'].reset_index()
    #print(GP)
    lst=[0]
    for index,row in GP.iterrows():
        lst.append(round(row['Total Revenue'],2))
    lst.pop()
    GP['Prv. Month Rev Target']=lst
    GP['Prv. Month Rev Target']=round(GP['Prv. Month Rev Target']*1.10,2)
    GP['OrderDate']=GP['OrderDate'].dt.date
    GP['Total Revenue']=round(GP['Total Revenue'],2)
    #print(GP)
    fig,ax=plt.subplots()
    fig.set_figheight(7)
    ax.set_title('Actual Vs Target Revenue')
    table=ax.table(cellText=GP.values,colLabels=GP.columns,loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(GP.columns))))
    ax.axis('off')
    fig.tight_layout()


def discont_products():
    DF=product_df[['ProductName','IsDiscontinued']]
    #DF=DF['ProductName']
    DF=DF.query(' IsDiscontinued==1 ')
    DF.drop(columns=['IsDiscontinued'],inplace=True)
    print(DF)
    fig,ax=plt.subplots()
    ax.set_title('DisContinued Products')
    table=ax.table(cellText=DF.values,colLabels=DF.columns,loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(DF.columns))))
    table.scale(0.5, 1.7)
    ax.axis('off')
    fig.tight_layout()


if __name__=='__main__':
    month_dic={"Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04", "May": "05", "Jun": "06",
               "Jul": "07","Aug": "08", "Sep": "09", "Oct": "10", "Nov": "11", "Dec": "12"}
    data_base = connector.connect(host='localhost', user='root', password='root1', database='northwind2021')
    cur = data_base.cursor()
    cur.execute('show tables')
    tables = cur.fetchall()
    print(tables)
    customer_df = pd.read_sql('select * from customer', data_base)
    orderitem_df = pd.read_sql('select * from orderitem', data_base)
    orders_df = pd.read_sql('select * from orders', data_base)
    product_df = pd.read_sql('select * from product', data_base)
    supplier_df = pd.read_sql('select * from supplier', data_base)
    update_cols()
    add_cols()
    top_bottom_10_prod_ev()
    top_3_prod_quantity_per_month()
    top_10_suppliers_in_prod_rev()
    top_10_customers_in_rev()
    top_5_cities_in_quantity()
    actual_vs_target_rev()
    discont_products()
    plt.show()