#Chapter 5.4.1 HW
library(nycflights13)
library(tidyverse)

#1: Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.
flightinfo <- select(flights, "dep_time", "dep_delay", "arr_time", "arr_delay")
flightinfo

select(flights, matches("dep"), matches("arr"), -matches("sched"))

select(flights, dep_time, dep_delay, arr_time, arr_delay)

select(flights, dep_time:arr_delay, -matches("sched"))

select(flights, contains("arr"), contains("dep"), -contains("sched"), -contains("carrier"))

#2: What happens if you include the name of a variable multiple times in a select() call?
select(flights, arr_time, arr_time)
#Nothing, it just shows up once.

#3: What does the one_of() function do? Why might it be helpful in conjunction with this vector?
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))
#Similar to the matches and contains function. This is helpful since there are other fields in between arr_delay and dep_time so by declaring vars in the beginning, I don't have to worry about excluding columns between them throughout my filtering.

#4: Does the result of running the following code surprise you? How do the select helpers deal with case by default? How can you change that default?
select(flights, contains("TIME"))
#It doesn't surprise me because I was googling earlier and found this and used it above. It doesn't look like R cares about case sensitive when using the contains function. This is what I found if you were worried about case sensitivity:
select(flights, contains("TIME", ignore.case = F))
