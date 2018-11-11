#Practice from Chapter 4 #1-3

#1: why does this code not work?
my_variable <- 10
my_variable
#Answer: the "i" in the variable trying to be called wasn't actually an i. Once I changed it, it worked.

#2: tweak each of the following R commands so that they run correctly.
library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)

#3:Press Alt + Shift + K. What happens? How can you get to the same place using the menus?
#Keyboard shortcut quick reference. You can also get here by going to tools -> keyboard shortcuts help