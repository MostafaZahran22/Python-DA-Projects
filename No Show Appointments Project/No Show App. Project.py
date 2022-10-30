import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from collections import defaultdict as dc, deque

def Update_columns():
    #####################################################################
    # Here I Switched tha Yes & No Values Of No-show Column
    # Then I Changed the name of No-show Column to Attended for Clarity
    # So Now Yes represent the people who attended there appointment
    # And No represent the people who didn't attend there appointment
    # print(apps_df['No-show'].value_counts())
    apps_df['No-show'].replace('No', '0', inplace=True)
    apps_df['No-show'].replace('Yes', '1', inplace=True)
    # print(apps_df['No-show'].value_counts())
    apps_df['No-show'].replace('0', 'Yes', inplace=True)
    apps_df['No-show'].replace('1', 'No', inplace=True)
    apps_df.rename(columns={'No-show': 'Attended'}, inplace=True)
    # Rename PatientId to PatientID to be consistent
    apps_df.rename(columns={'PatientId': 'PatientID'}, inplace=True)
    # print(apps_df['Attended'].value_counts())
    #######################################################################

    #######################################################################
    # Change the DataType of the ScheduledDay and AppointmentDay to datetime
    apps_df['AppointmentDay'] = pd.to_datetime(apps_df['AppointmentDay'])
    apps_df['ScheduledDay'] = pd.to_datetime(apps_df['ScheduledDay'])
    #######################################################################

    #######################################################################
    # Change the Handcap Column to Handicap
    apps_df.rename(columns={'Handcap': 'Handicap'}, inplace=True)
    # Change the 2,3&4 values to 1 so it would show a True or False statement
    apps_df['Handicap'].replace(2, 1,inplace=True)
    apps_df['Handicap'].replace(3, 1, inplace=True)
    apps_df['Handicap'].replace(4, 1, inplace=True)
    #######################################################################

    #######################################################################
    # Replace F with Female & M with Male
    apps_df['Gender'].replace('F', 'Female', inplace=True)
    apps_df['Gender'].replace('M', 'Male', inplace=True)
    #######################################################################

    #######################################################################
    # Remove All rows where ScheduledDay is in 2015
    #apps_df.drop(apps_df[apps_df['ScheduledDay'].dt.year==2015].index,inplace=True)
    #######################################################################

def Add_columns():
    #######################################################################
    # We add AppMonthName Column and AppDayName Column
    # that represent the name of month and day for each appointment
    apps_df['AppMonthName'] = apps_df['AppointmentDay'].dt.month_name()
    apps_df['AppDayName'] = apps_df['AppointmentDay'].dt.day_name()
    #######################################################################

    #######################################################################
    # Here added another column that has the number of health issues for each patient
    apps_df['Health_Issues_Num']=apps_df['Hipertension']+apps_df['Diabetes']+apps_df['Alcoholism']+apps_df['Handicap']
    # Then another column is added that would represent the names of the health issues
    name_lst=list()
    for index, row in apps_df.iterrows():
        str=''
        if row['Hipertension']==1:str+='Hipertension, '
        if row['Diabetes']==1:str+='Diabetes, '
        if row['Alcoholism']==1:str+='Alcoholism, '
        if row['Handicap']==1: str+='Handicap, '
        if len(str):str=str[:-2]
        else:str='No Health Issues'
        name_lst.append(str)
    apps_df['Health_Issues']=name_lst
    #######################################################################

    #######################################################################
    # Add AgeRange Column that group the ages into 4 groups
    # Under 21, from 21-35, from 35-50 and Over 50
    age_groups=list()
    for index, row in apps_df.iterrows():
        if row['Age']<21:age_groups.append('Under 21')
        elif row['Age']>=21 and row['Age']<35:age_groups.append('21-35')
        elif row['Age']>=35 and row['Age']<50:age_groups.append('35-50')
        else:age_groups.append('Over 50')
    apps_df['AgeGroups']=age_groups

def Gender_attendance():
    # In this function we visualize three pie charts
    # 1st one is the ratio between number of males and females who visited the doctor
    # 2nd is the ratio between the females who booked and those who attended
    # 3nd is the ratio between the males who booked and those who attended
    gender_att=apps_df.groupby(['Gender','Attended']).count()['PatientID'].reset_index()
    #print(gender_att)
    female_absent,female_attend,male_absent,male_attend=0,0,0,0
    for index,row in gender_att.iterrows():
        if row['Gender']=='Female' and row['Attended']=='No':female_absent+=row['PatientID']
        elif row['Gender']=='Female':female_attend+=row['PatientID']
        if row['Gender']=='Male' and row['Attended']=='No':male_absent+=row['PatientID']
        elif row['Gender']=='Male':male_attend+=row['PatientID']
    gender_att=gender_att.query(" Attended == 'Yes' ")
    #print(gender_att)
    gender_att.plot(kind='pie',y='PatientID',labels=gender_att['Gender'],autopct='%1.0f%%',title="Gender Ratio in Attendance",legend=False,colors=['pink','royalblue'])
    explode = (0.1,0)
    F_attend_fig,F_attend_ax=plt.subplots()
    M_attend_fig, M_attend_ax = plt.subplots()
    F_attend_ax.set_title('Female Attendance')
    M_attend_ax.set_title('Male Attendance')
    F_attend_ax.pie([female_attend,female_absent],labels=['Attended','Absent'],autopct='%1.0f%%',colors=['hotpink','crimson'],explode=explode)
    M_attend_ax.pie([male_attend, male_absent], labels=['Attended', 'Absent'], autopct='%1.0f%%',colors=['royalblue','crimson'],explode=explode)

def Apps_month():
    # This Function is to analyze whether a certain month has higher attendance than then other
    # And to show the rate of attendance of each month in comparison with the appointments booked
    all_month_appointments=apps_df.groupby(['AppMonthName','Attended']).count()['AppointmentID'].reset_index()
    all_month_appointments=all_month_appointments.query('Attended == "Yes"')
    #print(all_month_appointments)
    a_m_app_fig=plt.figure(figsize=(5,5))
    a_m_app_axis=sns.barplot(data=all_month_appointments,x='AppMonthName',y='AppointmentID')
    a_m_app_axis.set_title('Appointments Attended in Each Month')
    attended_month_apps=apps_df.groupby(['AppMonthName','Attended']).count()['AppointmentID'].reset_index()
    mo_att=dc(lambda :deque())
    for index,row in attended_month_apps.iterrows():
        if row['Attended']=='No':mo_att[row['AppMonthName']].append(row['AppointmentID'])
        elif row['Attended']=='Yes':mo_att[row['AppMonthName']].appendleft(row['AppointmentID'])
    #print(mo_att)
    for month in mo_att:
        Mo_attend_fig, Mo_attend_ax = plt.subplots()
        title=month+' Attendance Rate'
        Mo_attend_ax.set_title(title)
        Mo_attend_ax.pie(list(mo_att[month]),labels=['Attended','Absent'],autopct='%1.0f%%',colors=['royalblue','crimson'],explode=(0.1,0))

def Apps_day():
    # This Function is to analyze whether a certain Week Day has higher attendance than then other and if there is a holiday
    att_day=apps_df.groupby(['AppDayName','Attended']).count()['AppointmentID'].reset_index()
    att_day=att_day.query('Attended == "Yes"')
    att_day_fig=plt.figure(figsize=(7,5))
    att_day_axis=sns.barplot(data=att_day,x='AppDayName',y='AppointmentID')
    att_day_axis.set_title('All Days Of Week Attendance')
    # Conclusion: Sunday in a holiday and saturday appointments are far less than the other days
    # Which means that the people who book appointments in saturday are far less than the other days
    # Advice -> take Saturday a holiday

def Age_groups_attendance():
    # After We added Age groups to our data we now compare the number of appointments scheduled by each age group
    age_groups=apps_df.groupby(['AgeGroups']).count()['AppointmentID'].reset_index()
    age_groups=age_groups.reindex([3, 0, 1, 2])
    #print(age_groups)
    age_fig=plt.figure(figsize=(5,5))
    age_axis=sns.barplot(data=age_groups,x='AgeGroups',y='AppointmentID')
    age_axis.set_title('Age Groups Appointments')

def Neighborhood_attendance():
    # Here we compare between the top 10 clinics and bottom 10 clinics in appointments
    # So we could find if the neighborhood of the clinic has an effect on the appointments
    nei_att=apps_df.groupby(['Neighbourhood','Attended']).count()['AppointmentID'].reset_index()
    nei_att=nei_att.query('Attended == "Yes"')
    nei_att.sort_values(by=['AppointmentID'],inplace=True,ascending=False)
    #print(nei_att)
    top10_fig=plt.figure(figsize=(10,5))
    top10_axis=sns.barplot(data=nei_att[:10],x='Neighbourhood',y='AppointmentID')
    top10_axis.set_title('Top 10 Neighbourhood in Appointments')
    top10_axis.set_xticklabels(top10_axis.get_xticklabels(),fontsize=8,rotation=-35)
    plt.tight_layout()
    last10_fig=plt.figure(figsize=(10,5))
    last10_axis=sns.barplot(data=nei_att[-10:],x='Neighbourhood',y='AppointmentID')
    last10_axis.set_title('Bottom 10 Neighbourhood in Appointments')
    last10_axis.set_xticklabels(last10_axis.get_xticklabels(), fontsize=8, rotation=-35)
    plt.tight_layout()

def Scholarship_attendance():
    # Here We compare the attendace for people who received the bolsa familia scholarship and people who didn't
    scholarship_att=apps_df.groupby(['Scholarship','Attended']).count()['AppointmentID'].reset_index()
    #print(scholarship_att)
    sch_num=apps_df.groupby(['Scholarship']).count()['AppointmentID'].reset_index()
    #print(sch_num)
    got_sch_fig=plt.figure(figsize=(7,5))
    got_sch_axis=sns.barplot(data=sch_num,x=['No Scholarship','Got Scholarship'],y='AppointmentID')
    got_sch_axis.set_title("Difference between people who got scholarship and people who didn't")
    sch_att=dc(lambda :deque())
    for index,row in scholarship_att.iterrows():
        if row['Scholarship']==0 and row['Attended']=='No':sch_att['No Scholarship'].append(row['AppointmentID'])
        elif row['Scholarship']==0 and row['Attended']=='Yes':sch_att['No Scholarship'].appendleft(row['AppointmentID'])
        elif row['Scholarship']==1 and row['Attended']=='No':sch_att['Got Scholarship'].append(row['AppointmentID'])
        else: sch_att['Got Scholarship'].appendleft(row['AppointmentID'])
    print(sch_att)
    for S_Ship in sch_att:
        got_attend_fig, got_attend_ax = plt.subplots()
        got_attend_ax.set_title(S_Ship)
        got_attend_ax.pie(list(sch_att[S_Ship]),labels=['Attended','Absent'],autopct='%1.0f%%',colors=['royalblue','crimson'],explode=(0.1,0))

def Health_issues():
    # This function produces a table with the health issues, attendance, absence and attendance rate
    health_issues_apps=apps_df.groupby(['Health_Issues','Attended']).count()['AppointmentID'].reset_index()
    health_issues_apps.sort_values(by=['AppointmentID'],inplace=True,ascending=False)
    #health_issues_apps['Attended'].replace(['No','Yes'],['Absent','Attended'],inplace=True)
    #health_issues_apps.rename(columns={'AppointmentID':'Number of Appointments'},inplace=True)
    #print(health_issues_apps)
    abs_list,att_list=list(),list()
    nw_df_mp=dc(lambda :[0,0])
    for index,row in health_issues_apps.iterrows():
        if row['Attended']=='Yes':nw_df_mp[row['Health_Issues']][0]=(row['AppointmentID'])
        else:nw_df_mp[row['Health_Issues']][1]=(row['AppointmentID'])
    fi_df=dc(lambda :list())
    for iss in nw_df_mp:
        fi_df['Health_Issues'].append(iss)
        fi_df['Attended'].append(nw_df_mp[iss][0])
        fi_df['Absent'].append(nw_df_mp[iss][1])
    #print(fi_df)
    DF=pd.DataFrame(fi_df)
    DF['Attendance Rate']=round((DF['Attended']/(DF['Attended']+DF['Absent']))*100,1)
    DF.sort_values(by=['Attendance Rate'],ascending=False,inplace=True)
    DF['Attendance Rate']=DF['Attendance Rate'].astype(str)
    DF['Attendance Rate']=DF['Attendance Rate']+'%'
    #print(DF)
    issues_fig,issues_axis=plt.subplots()
    #issues_fig.set_figheight(7)
    #issues_fig.set_figwidth(9)
    issues_axis.set_title('Health Issues and thier Appointments')
    table=issues_axis.table(cellText=DF.values,colLabels=DF.columns,loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.auto_set_column_width(col=list(range(len(DF.columns))))
    #table.scale(0.5, 1.7)
    #table['Health_Issues'].scale(1.2,1.7)
    issues_axis.axis('off')
    issues_fig.tight_layout()

def SMS_attendance():
    # This function is to find the ratio of attendance when SMS is sent and when no SMS is sent
    sms=apps_df.groupby(['SMS_received','Attended']).count()['AppointmentID'].reset_index()
    #print(sms)
    sms_no_at_no=sms['AppointmentID'].iloc[0]
    sms_no_at_yes = sms['AppointmentID'].iloc[1]
    sms_yes_at_no = sms['AppointmentID'].iloc[2]
    sms_yes_at_yes = sms['AppointmentID'].iloc[3]
    no_sms_fig,no_sms_axis=plt.subplots()
    yes_sms_fig,yes_sms_axis=plt.subplots()
    no_sms_axis.set_title('Attended Vs Absent when no SMS is sent')
    no_sms_axis.pie([sms_no_at_yes,sms_no_at_no],labels=['Attended','Absent'],autopct='%1.0f%%',colors=['royalblue','crimson'],explode=(0.1,0))
    yes_sms_axis.set_title('Attended Vs Absent when SMS is sent')
    yes_sms_axis.pie([sms_yes_at_yes, sms_yes_at_no], labels=['Attended', 'Absent'], autopct='%1.0f%%',
                    colors=['royalblue', 'crimson'], explode=(0.1, 0))

if __name__=='__main__':
    apps_df = pd.read_csv('No-Show-Appointments.csv')
    Update_columns()
    Add_columns()
    print(apps_df.head())
    print(apps_df.info())
    Gender_attendance()
    Apps_month()
    Apps_day()
    Age_groups_attendance()
    Neighborhood_attendance()
    Scholarship_attendance()
    Health_issues()
    SMS_attendance()
    plt.show()