#Chapter 5.3.1 #1-4 HW
library(nycflights13)
library(tidyverse)
#1: How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
df <- tibble(x = c(5, 2, NA))
arrange(df, desc(is.na(x)))

#2: Sort flights to find the most delayed flights. Find the flights that left earliest.
arrange(flights, desc(dep_delay)) #Most delayed
arrange(flights, dep_delay) #Earliest

#3: Sort flights to find the fastest flights.
arrange(flights, (arr_time - dep_time)) #This gets you fastest start to finish flights
arrange(flights, air_time) #This gets you fastest flights regarding just air time

#4: Which flights travelled the longest? Which travelled the shortest?
#Longest and shortest by time
arrange(flights, desc(arr_time - dep_time)) #Longest
arrange(flights, (arr_time - dep_time)) #shortest

#Longest and shortest by distance
arrange(flights, desc(distance)) #longest
arrange(flights, distance) #shortest
