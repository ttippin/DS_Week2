install.packages('nycflights13')
library(nycflights13)
library(tidyverse)

#1:Find all flights that
#Had an arrival delay of two or more hours
filter(flights, arr_delay >= 120)

#Flew to Houston (IAH or HOU)
filter(flights, dest == "IAH" | dest == "HOU")

#Were operated by United, American, or Delta
filter(flights, carrier %in% c("UA","AA","DL"))

#Departed in summer (July, August, and September)
filter(flights, month %in% c(7:9))

#Arrived more than two hours late, but didn’t leave late
filter(flights, arr_delay > 120, dep_delay <= 0)

#Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, arr_delay >= 60, (dep_delay - arr_delay > 30))

#Departed between midnight and 6am (inclusive)
filter(flights, dep_time >= 2400 | dep_time <= 600)

#2: Another useful dplyr filtering helper is between(). What does it do? Can you use it to simplify the code needed to answer the previous challenges?
filter(flights, between(month, 7, 9))

#3: How many flights have a missing dep_time? What other variables are missing? What might these rows represent?
filter(flights, is.na(dep_time))  
#Other variables missing are dep_delay, arr_time and arr_delay. These rows could represent future flights that haven't happened yet.

#4: Why is NA ^ 0 not missing? Why is NA | TRUE not missing? Why is FALSE & NA not missing? Can you figure out the general rule? (NA * 0 is a tricky counterexample!)
NA ^ 0
#Because when you run this function, the value is 1.

NA | TRUE
#This function is saying NA or true has to be "true," where the second part is "true." 

FALSE & NA 
#Similar to the last function, R is looking to see if something is false before defaulting to "NA." (see below for better explanation)

#Based on everything I've googled, it seems like the general rule is when there is a logical expression, R will look to see if there is a possible result before defaulting to "NA" if one of the possible options can be tested (i.e. TRUE or "NA", it will look for TRUE first before defaulting to NA) 