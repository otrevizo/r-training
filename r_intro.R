#########################
#
# Intro to R 
#  Sep 2018
#
#########################


#########################
#
# Data Types:
#
# Vector, Matrix, Array, List, Data Frame
#

#
# Vector
#
# Atomic types:
# logical, integer, numeric, complex, character
#
# All the values must have a consistent data type within a vector
#

vtr_logical = c(TRUE, TRUE, FALSE, FALSE, TRUE)
vtr_logical

vtr_integer = c(256L, 1024L, 16L)
vtr_integer

vtr_numeric = c(2.718, 3.1416, 0.7071)
vtr_numeric

vtr_char = c("hello, world", "now i'm here", "now i'm there")
vtr_char

#
# Matrix
#

mtx1 = matrix(c(1:25), 5, 5)
mtx1

mtx2 = matrix(c(1:6), 2,3)
mtx2

#
# Array
#

arr1 = array(c(1:6), dim = c(2,3,4,2))
arr1

#
# Lists
#

list1 = list(vtr_char, vtr_integer, vtr_logical, vtr_numeric)
list1

#
# Data Frame
#

vtr_char_names = c("Jay", "Julie", "John")

data.frame(vtr_char_names, vtr_integer, vtr_numeric, vtr_char)

# airquality is a table already built in. let's use it
data.frame(airquality)

#####################
#
# Operators
#
# Arithmetic, Assignment, Relational, Logical
#

# Artithmetic
#
print(3+5.5)
print(15/3)
print(2^7)
print(22/7)

# modular division
print(22%%7)

# flow division rounds up to previous whole number
print(22%/%7)

# Relational opertors
# (compares)
#

var1 = 5
var2 = 12
print(var1 > var2) #the result is FALSE
print(var1 == var2) #the result is FALSE
print(var1 != var2) #the result is TRUE
print(var1 < var2) #the result is TRUE

# Assignment operators = or <- or -> left or right either way
#
# examples of assigning a value to x
#

x <- 15
x
x <- 4
x
x = 8
x
25 -> x
x

# Logical operators
#
# &, |, !

vtr2_logical = c(TRUE, FALSE,TRUE, FALSE, TRUE)
vtr3_logical = c(TRUE, TRUE, TRUE, TRUE, TRUE)
vtr4_logical = c(FALSE, FALSE, FALSE, FALSE, FALSE)

print(vtr2_logical & vtr3_logical)
print(vtr2_logical | vtr3_logical)
print(!vtr2_logical)
print(vtr2_logical && vtr3_logical)
print(vtr2_logical || vtr3_logical)

######################
#
# Conditional Statemets
#
# if, 

#
# if, else if
#

x = 3
if(x==5)
{
  print("x is equal to 5")
} else if(x > 5)
{
  print("x is greater than 5")
} else if(x<5)
{
  print("x is smaller than 5")  
}


#
# Switch Case Statement
#

x = 4   # it will look for the xth item
switch(x,
'1' = print("It's one"),
'2' = print("It's two"),
'3' = print("It's three"),
'4' = print("It's four"),
'5' = print("It's five"),
'6' = print("It's six"),
'7' = print("It's seven"),
'8' = print("It's eight"),
'9' = print("It's nine"),
'?' = print("I don't know, what is it?")
)

#
# Repeat Loop
#
# repeat{}

i = 0
repeat
{
  print(i)
  i = i + 1
  if(i > 9)
  {
    break
  }
}

#
# While Loop
#

i = 0
while(i < 10)
{
  print(i)
  i = i + 1
}

#
# For Loop
# When you know how many time the loop will execute
# 

for (i in 0:9)
{
  print(i)
}

####################
#
# String
#

str1 <- "How're you doing?"
print(str1)
nchar(str1)

str2 <- "Doing fine."
print(str2)
nchar(str2)

str3 = paste(str1, str2)
print(str3)
nchar(str3)

####################
#
# Functions
#
# Predefined and User Define
#

ftn1 <- function(x)
{
  x2 = x^2
  print(x)
  print(x2)
}

ftn1(3)

#####################
#
# Visualization
#
# Pie Charts, Bar Chart, Boxplot, Histogram, Line Graph, Scatterplot
#

pie(vtr_numeric, vtr_char_names)   # very plain piechart

pie(vtr_numeric, vtr_char_names, col = rainbow(length(vtr_numeric)))

barplot(vtr_numeric)

# mtcars is a built in dataset

boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders", 
        ylab = "Miles per Galon", main = "Milage Data",
        col=c("red", "yellow", "blue"))

vtr5_numberic = c(1,3,5,2,8,8,5,6,6,5,2,9,2,9,8)

hist(vtr5_numberic)

length(vtr5_numberic)
vtr6_numberic = c(1:length(vtr5_numberic))
vtr6_numberic

plot(vtr6_numberic, vtr5_numberic)

#######################
#
# Data Mining Techniques
# KDD Knowledge Discovery in Databases
#
# Anomaly Detection: Anusual patterns (outliers)
# Association Rule Mining: Market basket analysis (Netflix recommendations)
# Clustering: Segregate observations based on similarities (unsupervised learning)
# Classification: Labels (supervised learning)
# Regression: How one variable changes wrt another variable (needs labels). Many types
#
# R is dynamically typed programming language
# R is used by Facebook, Google, and Twitter
#
# Import dataset; pre-processing; data mining; pattern evaluation
#
#
#read.csv("/Users/otrevizo/Dropbox/SW/AI/R/TLC_Garage_RStudio/loan.csv")

#library(dplyr)
#houses %>% select(c(-1, -2)) -> houses # deletes columns 1 and 2
# Next change numerical variable to categorical variable
#houses$air_cond<-factor(houses$air_cond, labels=c("No", "Yes"))  # replaces 0 and 1 with no and yes
# Do that for many other columns

# Visualization install ggplot2
#library(ggplot2)
#ggplot(data=houses, aes(x=price))+geomhistogram(bins=40)
#
# many functions
#
# Now Data Mining Technique
#
#library(caTools)
#
#train<-subset(houses, split_index==T)
#test<-subset(houses, split_index==F)
#
#nrow(train)
#nrow(tet)
#
# Model Building
#
#lm(price~., data=train)->mod1
#predict(...)
#cbind(...)
#as.data.frame... # to fine the error in the predictions
#compare_result...
#cbind(compare...)
#sqrt(mean(comoare()))   # square root the error in prediction


