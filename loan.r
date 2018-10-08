library(rpart)
library(rpart.plot)

rm(list=ls())

setwd("C:/Users/att002/Documents/DR2 Misc Ref Materials/2018 Misc Ref Materials/20180910 GB Course Naperville/R Studio")

df <- read.csv("loan.csv", header=T, sep=",")

model <- rpart(Defaulted ~ ., data = df, control=rpart.control(minsplit=2, minbucket=1))
rpart.plot(model, extra=104, fallen.leaves = T, type=4, main="RPART Decision Tree")

df <- read.csv("diabetes.csv", header=T, sep=",")

model <- rpart(Diabetic ~ ., data = df, control=rpart.control(minsplit=2, minbucket=1))
rpart.plot(model, main="RPART Decision Tree for Diabetes")
