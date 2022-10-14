import pandas as pd
import numpy as np


############################################################################################################################
def solveboth(curr_city,month,day,city_name):
    ###################
    # ADD WeekDay Column that has the weekday that meets the day in the start time
    curr_city['WeekDay'] = curr_city['Start Time'].dt.day_name()
    # print(chicago_data.head(10))
    ###################

    ###################
    #ADD Start station and end station together
    curr_city['SEstation']=curr_city['Start Station']+" --> "+curr_city['End Station']
    #print(curr_city.head(10))
    ###################

    ######################
    # Data Frame with month and day
    mon_week_df = curr_city[curr_city['WeekDay'] == day]
    mon_week_df = mon_week_df[mon_week_df['Start Time'].dt.month == month]
    CHcount = len(mon_week_df.index)
    # print(mon_week_df)
    ######################

    ######################
    # Data For Trip Duration
    trip_duration_data = curr_city.groupby([pd.Grouper(key='Start Time', freq='M'), 'WeekDay']).sum()[['Trip Duration']].reset_index()
    # print(trip_duration_data)
    a = trip_duration_data['Start Time'].dt.month == month
    b = trip_duration_data['WeekDay'] == day
    month_trip_duration = trip_duration_data.loc[a & b, 'Trip Duration'].iloc[0]
    print("Trip Duration in Seconds: ", "%.2f" % (month_trip_duration))
    print("Trip Duration in Minutes: ", "%.2f" % (month_trip_duration / 60))
    print("Trip Duration in Hours: ", "%.2f" % (month_trip_duration / 60 / 60))
    print("Count= ", CHcount)
    print("Average Time in Seconds: ", "%.2f" % (month_trip_duration / CHcount))
    #######################

    #######################
    # Data for gender Count
    if city_name!="Washington":
        gender_count_data = curr_city.groupby([pd.Grouper(key='Start Time', freq='M'), 'WeekDay', 'Gender']).count()['Start Station'].reset_index()
        # print(gender_count_data)
        a = gender_count_data['Start Time'].dt.month == month
        b1 = gender_count_data['Gender'] == 'Male'
        b2 = gender_count_data['Gender'] == 'Female'
        c = gender_count_data['WeekDay'] == day
        male_count = gender_count_data.loc[a & b1 & c, 'Start Station'].iloc[0]
        female_count = gender_count_data.loc[a & b2 & c, 'Start Station'].iloc[0]
        print("Number of Males: ", male_count)
        print("Number of Females: ", female_count)
    ########################

    ########################
    # Data For user type
    user_type_count = curr_city.groupby([pd.Grouper(key='Start Time', freq='M'), 'WeekDay', 'User Type']).count()[
        'Start Station'].reset_index()
    # print(user_type_count)
    c1 = user_type_count['Start Time'].dt.month == month
    c2 = user_type_count['User Type'] == 'Customer'
    c3 = user_type_count['User Type'] == 'Subscriber'
    c4 = user_type_count['WeekDay'] == day
    customer_count = user_type_count.loc[c1 & c2 & c4, 'Start Station'].iloc[0]
    subscriber_count = user_type_count.loc[c1 & c3 & c4, 'Start Station'].iloc[0]
    print("Number of Customers: ", customer_count)
    print("Number of Subscribers: ", subscriber_count)
    ########################

    ###################
    # ADD Hour Column that has the hour in the start time of each entry
    curr_city['Hour'] = curr_city['Start Time'].dt.hour
    popular_hour = curr_city['Hour'].mode().iloc[0]
    print("Most Popular Hour : ", popular_hour)
    ###################

    ####################
    # Most Popular Start and End Stations
    popular_SS = mon_week_df['Start Station'].mode().iloc[0]
    popular_ES = mon_week_df['End Station'].mode().iloc[0]
    print("Most Popular Start Station : ", popular_SS)
    print("Most Poplar End Station :", popular_ES)
    ####################

    ####################
    # Most Popular Trip
    pop_trip= mon_week_df['SEstation'].mode().iloc[0]
    pop_trip_count=mon_week_df['SEstation'].value_counts()[pop_trip]
    print("Most Popular Trip: ",pop_trip," Count= ",pop_trip_count)
    ####################
#############################################################################################################################


#############################################################################################################################
def solvemonth(curr_city,month,city_name):
    ###################
    # ADD Start station and end station together
    curr_city['SEstation'] = curr_city['Start Station'] + " --> " + curr_city['End Station']
    # print(curr_city.head(10))
    ###################

    ###########################
    # Data Frame with month
    mon_df=curr_city[curr_city['Start Time'].dt.month==month]
    CHcount=len(mon_df)
    ###########################

    ######################
    # Data For Trip Duration
    trip_duration_data = curr_city.groupby([pd.Grouper(key='Start Time', freq='M')]).sum()[
        ['Trip Duration']].reset_index()
    # print(trip_duration_data)
    a = trip_duration_data['Start Time'].dt.month == month
    month_trip_duration = trip_duration_data.loc[a , 'Trip Duration'].iloc[0]
    print("Trip Duration in Seconds: ", "%.2f" % (month_trip_duration))
    print("Trip Duration in Minutes: ", "%.2f" % (month_trip_duration / 60))
    print("Trip Duration in Hours: ", "%.2f" % (month_trip_duration / 60 / 60))
    print("Count= ", CHcount)
    print("Average Time in Seconds: ", "%.2f" % (month_trip_duration / CHcount))
    #######################

    #######################
    # Data for gender Count
    if city_name != "Washington":
        gender_count_data = curr_city.groupby([pd.Grouper(key='Start Time', freq='M'), 'Gender']).count()[
            'Start Station'].reset_index()
        # print(gender_count_data)
        a = gender_count_data['Start Time'].dt.month == month
        b1 = gender_count_data['Gender'] == 'Male'
        b2 = gender_count_data['Gender'] == 'Female'
        male_count = gender_count_data.loc[a & b1, 'Start Station'].iloc[0]
        female_count = gender_count_data.loc[a & b2, 'Start Station'].iloc[0]
        print("Number of Males: ", male_count)
        print("Number of Females: ", female_count)
    ########################

    ########################
    # Data For user type
    user_type_count = curr_city.groupby([pd.Grouper(key='Start Time', freq='M'), 'User Type']).count()[
            'Start Station'].reset_index()
    # print(user_type_count)
    c1 = user_type_count['Start Time'].dt.month == month
    c2 = user_type_count['User Type'] == 'Customer'
    c3 = user_type_count['User Type'] == 'Subscriber'
    customer_count = user_type_count.loc[c1 & c2, 'Start Station'].iloc[0]
    subscriber_count = user_type_count.loc[c1 & c3, 'Start Station'].iloc[0]
    print("Number of Customers: ", customer_count)
    print("Number of Subscribers: ", subscriber_count)
    ########################

    ###################
    # ADD Hour Column that has the hour in the start time of each entry
    curr_city['Hour'] = curr_city['Start Time'].dt.hour
    popular_hour = curr_city['Hour'].mode().iloc[0]
    print("Most Popular Hour : ", popular_hour)
    ###################

    ####################
    # Most Popular Start and End Stations
    popular_SS = mon_df['Start Station'].mode().iloc[0]
    popular_ES = mon_df['End Station'].mode().iloc[0]
    print("Most Popular Start Station : ", popular_SS)
    print("Most Poplar End Station :", popular_ES)
    ####################

    ####################
    # Most Popular Trip
    pop_trip = mon_df['SEstation'].mode().iloc[0]
    pop_trip_count = mon_df['SEstation'].value_counts()[pop_trip]
    print("Most Popular Trip: ", pop_trip, " Count= ", pop_trip_count)
    ####################
#############################################################################################################################


#############################################################################################################################
def solveday(curr_city,day,city_name):
    ###################
    # ADD WeekDay Column that has the weekday that meets the day in the start time
    curr_city['WeekDay'] = curr_city['Start Time'].dt.day_name()
    # print(chicago_data.head(10))
    ###################

    ###################
    # ADD Start station and end station together
    curr_city['SEstation'] = curr_city['Start Station'] + " --> " + curr_city['End Station']
    # print(curr_city.head(10))
    ###################

    ######################
    # Data Frame with day
    week_df = curr_city[curr_city['WeekDay'] == day]
    CHcount = len(week_df.index)
    # print(mon_week_df)
    ######################

    ######################
    # Data For Trip Duration
    trip_duration_data = curr_city.groupby(['WeekDay']).sum()[
        ['Trip Duration']].reset_index()
    # print(trip_duration_data)
    b = trip_duration_data['WeekDay'] == day
    month_trip_duration = trip_duration_data.loc[b, 'Trip Duration'].iloc[0]
    print("Trip Duration in Seconds: ", "%.2f" % (month_trip_duration))
    print("Trip Duration in Minutes: ", "%.2f" % (month_trip_duration / 60))
    print("Trip Duration in Hours: ", "%.2f" % (month_trip_duration / 60 / 60))
    print("Count= ", CHcount)
    print("Average Time in Seconds: ", "%.2f" % (month_trip_duration / CHcount))
    #######################

    #######################
    # Data for gender Count
    if city_name != "Washington":
        gender_count_data = curr_city.groupby(['WeekDay', 'Gender']).count()[
            'Start Station'].reset_index()
        # print(gender_count_data)
        b1 = gender_count_data['Gender'] == 'Male'
        b2 = gender_count_data['Gender'] == 'Female'
        c = gender_count_data['WeekDay'] == day
        male_count = gender_count_data.loc[b1 & c, 'Start Station'].iloc[0]
        female_count = gender_count_data.loc[b2 & c, 'Start Station'].iloc[0]
        print("Number of Males: ", male_count)
        print("Number of Females: ", female_count)
    ########################

    ########################
    # Data For user type
    user_type_count = curr_city.groupby(['WeekDay', 'User Type']).count()[
            'Start Station'].reset_index()
    # print(user_type_count)
    c2 = user_type_count['User Type'] == 'Customer'
    c3 = user_type_count['User Type'] == 'Subscriber'
    c4 = user_type_count['WeekDay'] == day
    customer_count = user_type_count.loc[c2 & c4, 'Start Station'].iloc[0]
    subscriber_count = user_type_count.loc[c3 & c4, 'Start Station'].iloc[0]
    print("Number of Customers: ", customer_count)
    print("Number of Subscribers: ", subscriber_count)
    ########################

    ###################
    # ADD Hour Column that has the hour in the start time of each entry
    curr_city['Hour'] = curr_city['Start Time'].dt.hour
    popular_hour = curr_city['Hour'].mode().iloc[0]
    print("Most Popular Hour : ", popular_hour)
    ###################

    ####################
    # Most Popular Start and End Stations
    popular_SS = week_df['Start Station'].mode().iloc[0]
    popular_ES = week_df['End Station'].mode().iloc[0]
    print("Most Popular Start Station : ", popular_SS)
    print("Most Poplar End Station :", popular_ES)
    ####################

    ####################
    # Most Popular Trip
    pop_trip = week_df['SEstation'].mode().iloc[0]
    pop_trip_count = week_df['SEstation'].value_counts()[pop_trip]
    print("Most Popular Trip: ", pop_trip, " Count= ", pop_trip_count)
    ####################
#############################################################################################################################

#############################################################################################################################
def solvenone(curr_city,city_name):
    ###################
    # ADD Start station and end station together
    curr_city['SEstation'] = curr_city['Start Station'] + " --> " + curr_city['End Station']
    # print(curr_city.head(10))
    ###################

    ######################
    # Data For Trip Duration
    trip_duration=curr_city['Trip Duration'].sum()
    CHcount=len(curr_city.index)
    print("Trip Duration in Seconds: ", "%.2f" % (trip_duration))
    print("Trip Duration in Minutes: ", "%.2f" % (trip_duration / 60))
    print("Trip Duration in Hours: ", "%.2f" % (trip_duration / 60 / 60))
    print("Count= ", CHcount)
    print("Average Time in Seconds: ", "%.2f" % (trip_duration / CHcount))
    #####################

    #######################
    # Data for gender Count
    if city_name != "Washington":
        gender_count=curr_city['Gender'].value_counts()
        print(gender_count)
    #######################

    ########################
    # Data For user type
    user_type_count=curr_city['User Type'].value_counts()
    print(user_type_count)
    ########################

    ###################
    # ADD Hour Column that has the hour in the start time of each entry
    curr_city['Hour'] = curr_city['Start Time'].dt.hour
    popular_hour = curr_city['Hour'].mode().iloc[0]
    print("Most Popular Hour : ", popular_hour)
    ###################

    ####################
    # Most Popular Start and End Stations
    popular_SS = curr_city['Start Station'].mode().iloc[0]
    popular_ES = curr_city['End Station'].mode().iloc[0]
    print("Most Popular Start Station : ", popular_SS)
    print("Most Poplar End Station :", popular_ES)
    ####################

    ####################
    # Most Popular Trip
    pop_trip = curr_city['SEstation'].mode().iloc[0]
    pop_trip_count = curr_city['SEstation'].value_counts()[pop_trip]
    print("Most Popular Trip: ", pop_trip, " Count= ", pop_trip_count)
    ####################
#############################################################################################################################


def main():
    while True:
        print("Hello! let's explore some US BikeShare data")
        city = input("Please choose a city from Chicago , NewYork & Washington ")
        city = city.capitalize()
        if city == "Chicago":
            print("Would you like to see first 5 rows of data?")
            print("Enter Y/y if you would like to see, Enter anything else if you don't want to see")
            five_rows = input()
            if five_rows == "Y" or five_rows == 'y': print(chicago_data.head())
            print("Would you like to filter the date by Month, Day, Both or None")
            ip = input()
            ip = ip.capitalize()
            if ip == "Both":
                print("Which month would you like to filter by")
                print("January, February, March, April, May or June")
                minp = input()
                minp = minp.capitalize()
                if minp not in Months:
                    print("Wrong Month input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                print("Which Day would you like to filter by")
                print("Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday")
                dinp = input()
                dinp = dinp.capitalize()
                if dinp not in Days:
                    print("Wrong Day input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                mo = mp_month[minp]
                solveboth(chicago_data.copy(), mo, dinp, "Chicago")
            elif ip == "Month":
                print("Which month would you like to filter by")
                print("January, February, March, April, May or June")
                minp = input()
                minp = minp.capitalize()
                if minp not in Months:
                    print("Wrong Month input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                mo = mp_month[minp]
                solvemonth(chicago_data.copy(), mo, "Chicago")
            elif ip == "Day":
                print("Which Day would you like to filter by")
                print("Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday")
                dinp = input()
                dinp = dinp.capitalize()
                if dinp not in Days:
                    print("Wrong Day input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                solveday(chicago_data.copy(), dinp, "Chicago")
            elif ip == "None":
                solvenone(chicago_data.copy(), "Chicago")
            else:
                print("Please Enter aValid Choice")
        elif city == "Newyork":
            print("Would you like to see first 5 rows of data?")
            print("Enter Y/y if you would like to see, Enter anything else if you don't want to see")
            five_rows = input()
            if five_rows == "Y" or five_rows == 'y': print(newyork_data.head())
            print("Would you like to filter the date by Month, Day, Both or none")
            ip = input()
            ip = ip.capitalize()
            if ip == "Both":
                print("Which month would you like to filter by")
                print("January, February, March, April, May or June")
                minp = input()
                minp = minp.capitalize()
                if minp not in Months:
                    print("Wrong Month input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                print("Which Day would you like to filter by")
                print("Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday")
                dinp = input()
                dinp = dinp.capitalize()
                if dinp not in Days:
                    print("Wrong Day input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                mo = mp_month[minp]
                solveboth(newyork_data.copy(), mo, dinp, "NewYork")
            elif ip == "Month":
                print("Which month would you like to filter by")
                print("January, February, March, April, May or June")
                minp = input()
                minp = minp.capitalize()
                if minp not in Months:
                    print("Wrong Month input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                mo = mp_month[minp]
                solvemonth(newyork_data.copy(), mo, "NewYork")
            elif ip == "Day":
                print("Which Day would you like to filter by")
                print("Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday")
                dinp = input()
                dinp = dinp.capitalize()
                if dinp not in Days:
                    print("Wrong Day input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                solveday(newyork_data.copy(), dinp, "NewYork")
            elif ip == "None":
                solvenone(newyork_data.copy(), "NewYork")
            else:
                print("Please Enter aValid Choice")
        elif city == "Washington":
            print("Would you like to see first 5 rows of data?")
            print("Enter Y/y if you would like to see, Enter anything else if you don't want to see")
            five_rows = input()
            if five_rows == "Y" or five_rows == 'y': print(washington_data.head())
            print("Would you like to filter the date by Month, Day, Both or none")
            ip = input()
            ip = ip.capitalize()
            if ip == "Both":
                print("Which month would you like to filter by")
                print("January, February, March, April, May or June")
                minp = input()
                minp = minp.capitalize()
                if minp not in Months:
                    print("Wrong Month input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                print("Which Day would you like to filter by")
                print("Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday")
                dinp = input()
                dinp = dinp.capitalize()
                if dinp not in Days:
                    print("Wrong Day input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                mo = mp_month[minp]
                solveboth(washington_data.copy(), mo, dinp, "Washington")
            elif ip == "Month":
                print("Which month would you like to filter by")
                print("January, February, March, April, May or June")
                minp = input()
                minp = minp.capitalize()
                if minp not in Months:
                    print("Wrong Month input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                mo = mp_month[minp]
                solvemonth(washington_data.copy(), mo, "Washington")
            elif ip == "Day":
                print("Which Day would you like to filter by")
                print("Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday")
                dinp = input()
                dinp = dinp.capitalize()
                if dinp not in Days:
                    print("Wrong Day input")
                    print("Enter Y/y if you want to inquire more else enter anything else")
                    y_n = input()
                    if y_n == 'Y' or y_n == 'y':
                        continue
                    else:
                        break
                solveday(washington_data.copy(), dinp, "Washington")
            elif ip == "None":
                solvenone(washington_data.copy(), "Washington")
            else:
                print("Please Enter aValid Choice")
        else:
            print("Please Enter a valid city")
        print("Enter Y/y if you want to inquire more else enter anything else")
        y_n = input()
        if y_n == 'Y' or y_n == 'y':
            continue
        else:
            break


if __name__=='__main__':
    #####################
    # Load data
    chicago_data = pd.read_csv('chicago.csv')
    newyork_data = pd.read_csv('new_york_city.csv')
    washington_data = pd.read_csv('washington.csv')
    #####################
    # print(chicago_data.head())
    # print(newyork_data.head())
    # print(washington_data.head())

    #####################
    # change date columns into datetime stamp
    chicago_data['Start Time'] = pd.to_datetime(chicago_data['Start Time'])
    chicago_data['End Time'] = pd.to_datetime(chicago_data['End Time'])
    newyork_data['Start Time'] = pd.to_datetime(newyork_data['Start Time'])
    newyork_data['End Time'] = pd.to_datetime(newyork_data['End Time'])
    washington_data['Start Time'] = pd.to_datetime(washington_data['Start Time'])
    washington_data['End Time'] = pd.to_datetime(washington_data['End Time'])
    ######################
    mp_month = {"January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6}
    Days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    Months = ["January", "February", "March", "April", "May", "June"]
    main()

