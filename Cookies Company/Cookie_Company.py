import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

cookie_data=pd.read_csv('Cookie.csv')
cookie_data['Date']=pd.to_datetime(cookie_data['Date'])
cookie_data.drop(['Revenue','Cost','Month Name','Month Number','Profit'],axis=1,inplace=True)
cookie_data.rename(columns={'Revenue per cookie':'Price','Cost per cookie':'Cost'},inplace=True)
cookie_data['Price']=cookie_data['Price'].str[1:]
cookie_data['Cost']=cookie_data['Cost'].str[1:]
cookie_data[['Price','Cost']]=cookie_data[['Price','Cost']].astype(str).astype(float)
cookie_data['Total Revenue']=cookie_data['Price']*cookie_data['Units Sold']
cookie_data['Total Cost']=cookie_data['Cost']*cookie_data['Units Sold']
cookie_data['Profit']=cookie_data['Total Revenue']-cookie_data['Total Cost']
cookie_data['Day Name']=cookie_data['Date'].dt.day_name()
cookie_data['Month Number']=cookie_data['Date'].dt.month
cookie_data['Month Name']=cookie_data['Date'].dt.month_name()
print(cookie_data.info())

##################################
# Total Revenue by Country
tot_rev_by_county=cookie_data.groupby(['Country']).sum()['Total Revenue'].reset_index()
#print(tot_rev_by_county)
fig1=plt.figure(figsize=(10,5))
axis1=sns.barplot(data=tot_rev_by_county,x='Country',y='Total Revenue')
axis1.set_title("Total Revenue by Country",size=10)
###################################

###################################
# Count of Products Sold by Month
sales_by_month=cookie_data.groupby(['Month Name','Month Number']).sum()['Units Sold'].reset_index()
sales_by_month.sort_values(by=['Month Number'],ascending=True,inplace=True)
#print(sales_by_month)
fig2=plt.figure(figsize=(13,5))
axis2=sns.lineplot(data=sales_by_month,x='Month Name',y='Units Sold')
axis2.set_title("Quanityt Sold by Month",size=10)
###################################

###################################
# Top 5 Products in Profit
prod_prof=cookie_data.groupby(['Product']).sum()['Profit'].reset_index()
prod_prof.sort_values(by=['Profit'],ascending=False,inplace=True)
prod_prof=prod_prof.iloc[:5]
#print(prod_prof)
prod_prof.plot(legend=False,y='Profit',kind='pie',labels=prod_prof['Product'],autopct='%1.0f%%',title='Top 5 Products in Profit',figsize=(10,5))
###################################

###################################
# Count of Sales Operations by Week Days
years_sales_op=cookie_data.groupby(['Day Name']).count()['Product'].reset_index()
#print(years_sales_op)
fig4=plt.figure(figsize=(10,5))
axis4=sns.barplot(data=years_sales_op,x='Day Name',y='Product')
axis4.set_title("Sales Operations by Week Day",size=10)
###################################

###################################
# Most and Least Products in Cost
prod_cost=cookie_data.groupby(['Product']).sum()['Total Cost'].reset_index()
prod_cost.sort_values(by=['Total Cost'],ascending=True,inplace=True)
#print(prod_cost)
print(prod_cost.iloc[0].iloc[0],prod_cost.iloc[0].iloc[1])
print(prod_cost.iloc[-1].iloc[0],prod_cost.iloc[-1].iloc[1])
###################################

plt.show()
