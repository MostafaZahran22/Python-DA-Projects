import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

covid_df=pd.read_csv("2019_Covid-19_data.csv")
#print(covid_df.head())
#print(covid_df.info())
#print(covid_df.describe())
covid_df.drop(["Sno","Last Update"],inplace=True,axis=1)

# Drop the discrepancy in Country column where country name is 3/6/2020 22:00
covid_df.drop(covid_df[covid_df['Country']=='3/6/2020 22:00'].index,inplace=True)
#print(covid_df.head())
#print("/////////////////////////////////////////////////////////////////////")
covid_df['Date']= pd.to_datetime(covid_df['Date'])
covid_df['Date']= covid_df['Date'].dt.date
covid_df['Date']= pd.to_datetime(covid_df['Date'])
#print(covid_df.head())
#print(covid_df.info())
# Active Cases
covid_df['Active_Cases']=covid_df['Confirmed']-(covid_df['Deaths']+covid_df['Recovered'])

# Pivot table country wise
country_pivot=pd.pivot_table(covid_df,values=['Confirmed','Deaths','Recovered'],index='Country',aggfunc=sum)
country_pivot['Recovery_Rate']=country_pivot['Recovered']/country_pivot['Confirmed']*100
country_pivot['Mortality_Rate']=country_pivot['Deaths']/country_pivot['Confirmed']*100
country_pivot.style.background_gradient(cmap='summer')
#print(country_pivot)
#country_pivot.plot()
#plt.show()

# Top 10 Countries with active cases
top_10_active_cases=covid_df.groupby(by='Country').sum()[['Active_Cases','Confirmed']].sort_values(by=['Active_Cases'],ascending=False).reset_index()
#print(top_10_active_cases)
# Plot Top 10 Active Cases
fig1=plt.figure(figsize=(10,5))
#plt.title("Top 10 Active Cases Countries",size=10)
axis=sns.barplot(data=top_10_active_cases.iloc[:10],x='Country',y='Active_Cases')
axis.set_title("Top 10 Active Cases Countries",size=10)

# Active Cases By Months
date_cases=covid_df.groupby(pd.Grouper(key='Date',freq='M')).sum()[["Active_Cases"]].sort_values(by='Active_Cases',ascending=True).reset_index()
#print(date_cases)
fig2=plt.figure(figsize=(10,5))
#plt.title("Active Cases By Months",size=10)
axis2=sns.pointplot(data=date_cases,x='Date',y='Active_Cases')
axis2.set_title("Active Cases By Months",size=10)

# Top 10 Stated in deaths
states_deaths=covid_df.groupby(by='Province/State').sum()[['Active_Cases']].sort_values(by='Active_Cases',ascending=False).reset_index()
fig3=plt.figure(figsize=(10,5))
#plt.title("Top 10 States in Deaths",size=10)
axis3=sns.barplot(x='Province/State',y='Active_Cases',data=states_deaths.iloc[:10])
axis3.set_title("Top 10 States in Deaths",size=10)

# Confirmed cases update by time in some countries
fig4=plt.figure(figsize=(13,5))
#plt.title("Countries Confirmed Cases Update",size=10)
axis4=sns.lineplot(x='Date',y='Confirmed',data=covid_df[covid_df['Country'].isin(['China','US','Spain','Italy','Germany'])],hue='Country')
axis4.set_title("Countries Confirmed Cases Update",size=10)

plt.show()