import sqlite3
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt


def update_cols():
    orders_df['occurred_at']=pd.to_datetime(orders_df['occurred_at'])
    accounts_df.rename(columns={'name':'account_name','id':'account_id'},inplace=True)
    sales_reps_df.rename(columns={'name': 'sales_rep_name','id':'sales_rep_id'}, inplace=True)
    regions_df.rename(columns={'name': 'region_name','id':'region_id'}, inplace=True)
    orders_df.rename(columns={'id':'order_id'},inplace=True)


def type_sales_by_date():
    # Line chart that shows the sales of the three paper types over time
    gp=orders_df.groupby(pd.Grouper(key='occurred_at',freq='M')).sum()[['standard_qty','poster_qty','gloss_qty']]
    #print(gp)
    plt.figure(figsize=(8,6))
    plt.title('Types Sales Over Time')
    axis=sns.lineplot(gp)
    axis.tick_params(axis='x', rotation=15)



def total_rev_by_region():
    # Pie chart that shows the total revenue generated over all regions and their proportions
    DF=pd.merge(left=sales_reps_df,right=regions_df,left_on='region_id',right_on='region_id')
    DF=pd.merge(left=accounts_df,right=DF,left_on='sales_rep_id',right_on='sales_rep_id')
    DF=pd.merge(left=orders_df,right=DF,left_on='account_id',right_on='account_id')
    print(DF.info())
    GP=DF.groupby(['region_name']).sum()[['total_amt_usd']].reset_index()
    plt.figure(figsize=(6,6))
    plt.pie(GP['total_amt_usd'], labels=GP['region_name'],  autopct='%.0f%%')
    plt.title('Revenue Percentage By Region')


def general_info():
    DF = orders_df
    years_list=list(orders_df['occurred_at'].dt.year.unique())
    years_list=sorted(years_list)
    ##########################################
    # To filter the info by year
    #year=2013
    #DF = orders_df[orders_df['occurred_at'].dt.year == year]
    ##########################################
    Total_rev=DF.sum()['total_amt_usd']
    Total_sales=round(DF.sum()['total'])
    standard_avg=round(DF.mean()['standard_qty'])
    posetr_avg = round(DF.mean()['poster_qty'])
    gloss_avg = round(DF.mean()['gloss_qty'])
    print('Total Revenue :',Total_rev,'$')
    print('Total Sales :', Total_sales)
    print('Standard Type Avg Sales :', standard_avg)
    print('Poster Type Avg Sales :', posetr_avg)
    print('Gloss Type Avg Sales :', gloss_avg)
    ############################################
    # Make a figure to display all the general info
    fig = plt.figure(figsize=(7, 5))
    fig.text(0.5, 0.95, "General Info", ha='center', va='center', size=20, color='black')
    fig.text(0.5, 0.75, f"Total Revenue : {Total_rev} $",ha='center', va='center', size=12,color='green')
    fig.text(0.5, 0.65, f"Total Sales : {Total_sales}", ha='center', va='center', size=12, color='cyan')
    fig.text(0.5, 0.55, f"Standard Type Avg Sales : {standard_avg}", ha='center', va='center', size=12, color='blue')
    fig.text(0.5, 0.45, f"Poster Type Avg Sales : {posetr_avg}", ha='center', va='center', size=12, color='blue')
    fig.text(0.5, 0.35, f"Gloss Type Avg Sales : {gloss_avg}", ha='center', va='center', size=12, color='blue')



def sales_reps_info():
    DF=pd.merge(left=sales_reps_df,right=accounts_df,left_on='sales_rep_id',right_on='sales_rep_id')
    DF=pd.merge(left=DF,right=orders_df,left_on='account_id',right_on='account_id')
    #######################################
    # Change the name of the sales rep from here
    s_r_name='Akilah Drinkard'
    #######################################
    DF=DF[DF['sales_rep_name']==s_r_name]
    rev_gen=DF['total_amt_usd'].sum()
    sales_gen=DF['total'].sum()
    s_r_id=DF['sales_rep_id'].iloc[0]
    account_resp_for=DF['account_name'].unique()
    print(s_r_id)
    print('Sales Rep. Name :', s_r_name)
    print('Total Revenue :', rev_gen, '$')
    print('Total Sales :', sales_gen)
    print('Sales Rep. ID :', s_r_id)
    print('Sales Rep Accounts :',end=' ')
    print(*account_resp_for,sep=', ')
    ############################################
    # Make a figure to display all the sales reps info
    fig = plt.figure(figsize=(7, 5))
    fig.text(0.5, 0.95, "Sales Rep Info", ha='center', va='center', size=20, color='black')
    fig.text(0.5, 0.75, f"Sales Rep. Name : {s_r_name}", ha='center', va='center', size=12, color='black')
    fig.text(0.5, 0.65, f"Sales Rep. ID : {s_r_id} ", ha='center', va='center', size=12, color='black')
    fig.text(0.5, 0.55, f"Sales Rep Accounts : {account_resp_for}", ha='center', va='center', size=12, color='blue')
    fig.text(0.5, 0.45, f"Total Revenue : {rev_gen} $", ha='center', va='center', size=12, color='green')
    fig.text(0.5, 0.35, f"Total Sales : {sales_gen}", ha='center', va='center', size=12, color='cyan')

    #####################################################
    # Line chart of sales rep revenue generated over time
    REV_GP=DF.groupby(pd.Grouper(key='occurred_at',freq='M')).sum()[['total_amt_usd']]
    SALES_GP=DF.groupby(pd.Grouper(key='occurred_at',freq='M')).sum()[['total']]
    #print(REV_GP)
    #print(SALES_GP)
    plt.figure(figsize=(9, 6))
    plt.title('Sales Rep. Revenue Generated Over Time',color='g')
    axis = sns.lineplot(REV_GP,palette=['g'])
    axis.tick_params(axis='x', rotation=15)

    ############################################
    # Line chart of sales rep sales over time
    plt.figure(figsize=(9, 6))
    plt.title('Sales Rep. Sales Over Time', color='c')
    axis = sns.lineplot(SALES_GP,palette=['c'])
    axis.tick_params(axis='x', rotation=15)

    ############################################
    # Line chart of sales rep revenue generated & sales together over time
    fig, (ax1, ax2) = plt.subplots(2,figsize=(9,8))
    plt.subplots_adjust(hspace=0.3)
    fig.suptitle('Sales Reps Revenue & Sales Together')
    ax1.set_title('Sales Rep. Revenue Generated Over Time',color='g')
    ax1.plot(REV_GP,color='green')
    ax1.tick_params(axis='x', rotation=15)
    ax2.set_title('Sales Rep. Sales Over Time', color='c')
    ax2.plot(SALES_GP,color='cyan')
    ax2.tick_params(axis='x', rotation=15)


def accounts_info():
    DF=pd.merge(left=orders_df,right=accounts_df,left_on='account_id',right_on='account_id')
    DF=pd.merge(left=DF,right=sales_reps_df,left_on='sales_rep_id',right_on='sales_rep_id')
    #####################################
    # Change the name of the account from here
    account_name='3M'
    #####################################
    DF=DF[DF['account_name']==account_name]
    poc=DF['primary_poc'].iloc[0]
    rev_gen = DF['total_amt_usd'].sum()
    sales_gen = DF['total'].sum()
    web_site=DF['website'].iloc[0]
    print('Account Name:',account_name)
    print('Person of Contact:',poc)
    print('Total Revenue :', rev_gen, '$')
    print('Total Sales :', sales_gen)
    print('Account Website :',web_site)
    ############################################
    # Make a figure to display all the accounts info
    fig = plt.figure(figsize=(7, 5))
    fig.text(0.5, 0.95, "Account Info", ha='center', va='center', size=20, color='black')
    fig.text(0.5, 0.75, f"Account Name : {account_name}", ha='center', va='center', size=12, color='black')
    fig.text(0.5, 0.65, f"Person of Contact : {poc} ", ha='center', va='center', size=12, color='black')
    fig.text(0.5, 0.55, f"Account Website : {web_site}", ha='center', va='center', size=12, color='blue')
    fig.text(0.5, 0.45, f"Total Revenue : {rev_gen} $", ha='center', va='center', size=12, color='green')
    fig.text(0.5, 0.35, f"Total Sales : {sales_gen}", ha='center', va='center', size=12, color='cyan')

    ##################################################
    # Line chart of account revenue generated over time
    REV_GP=DF.groupby(pd.Grouper(key='occurred_at',freq='M')).sum()[['total_amt_usd']]
    SALES_GP=DF.groupby(pd.Grouper(key='occurred_at',freq='M')).sum()[['total']]
    plt.figure(figsize=(8,6))
    plt.title('Account Revenue Generated Over Time',color='g')
    axis=sns.lineplot(REV_GP,palette=['g'])
    axis.tick_params(axis='x', rotation=15)

    ##############################################
    # Line chart of account sales over time
    plt.figure(figsize=(8,6))
    plt.title('Account Total Sales Over Time',color='c')
    axis=sns.lineplot(SALES_GP,palette=['c'])
    axis.tick_params(axis='x',rotation=15)

    ###############################################
    # Line chart of account revenue generated and sales together over time
    fig,(ax1,ax2)=plt.subplots(2,figsize=(9,9))
    plt.subplots_adjust(hspace=0.3)
    fig.suptitle('Account Revenue & Sales Together')
    ax1.set_title('Account Revenue Generated Over Time', color='g')
    ax1.plot(REV_GP, color='green')
    ax1.tick_params(axis='x', rotation=15)
    ax2.set_title('Account Sales Over Time', color='c')
    ax2.plot(SALES_GP, color='cyan')
    ax2.tick_params(axis='x', rotation=15)


if __name__=='__main__':
    con = sqlite3.connect("pandp.sqlite")
    orders_df = pd.read_sql_query("SELECT * from orders", con)
    accounts_df = pd.read_sql_query("SELECT * from accounts", con)
    sales_reps_df = pd.read_sql_query("SELECT * from sales_reps", con)
    regions_df = pd.read_sql_query("SELECT * from region", con)
    web_events_df = pd.read_sql_query("SELECT * from web_events", con)
    update_cols()
    #print(orders_df.info())
    #print(accounts_df.info())
    #print(sales_reps_df.info())
    #print(regions_df.info())
    type_sales_by_date()
    total_rev_by_region()
    general_info()
    sales_reps_info()
    accounts_info()


    plt.show()
    con.close()