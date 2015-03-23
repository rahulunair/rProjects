# Logistic Regression

#1.Using Smarket data (package "ISLR") build a logistic regression model
#for predicting Direction (up and down) of stock price. 
#In calculating the error you may use training data for (Year<2005) and 
#test for (Year>=2005)
#Find error rate for the training data and test data.

########################################################################################
# installing and loading the required packages
install.packages('ISLR')
library(ISLR)
data("Smarket")

# understanding the dataset
str(Smarket)
?Smarket
# correlation matrix to see if there is any relation between different attributes
cor(Smarket[, -9])  
# Except for the significant relationship between volume and year we cannot find any
# relationship between any other variables

# splitting the dataset between train and test
Smarket.train <- Smarket[Smarket$Year < 2005,] #998 observations
Smarket.test <- Smarket[(Smarket$Year >= 2005), ] # 252 observations
summary(Smarket.train)
nrow(Smarket.test)

# modelling direction of market and other attributes using logistic regression using trainig data.
logit.model <-  glm (Direction ~ Volume + Lag1 + Lag2 + Lag3, family = binomial, data = Smarket.train)
# testing the model.
length(logit.model)
logit.prob=predict(logit.model,Smarket.2005,type="response")
logit.prob [1:10]
length(logit.prob)
logit.predict = rep("Down", length(logit.prob))
logit.predict[logit.prob > 0.5] <- "Up"
length(logit.predict)
table(logit.predict, Smarket.test$Direction) # cross table of prediction and real direction
mean(logit.predict== Smarket.test$Direction)  # Training errror rate
mean(logit.predict != Smarket.test$Direction) # Testing error rate

#################################################################################






