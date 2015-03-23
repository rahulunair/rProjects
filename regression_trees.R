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
Smarket.test <- Smarket[!(Smarket$Year < 2005), ] # 252 observations
summary(Smarket.train)

# modelling direction of market and other attributes using logistic regression.
logit.model <-  glm (Direction ~ Volume + Lag1 + Lag2 + Lag3 + Lag4 + Lag5, family = binomial, data = Smarket.train)
logit.predict <- predict(logit.model, type = 'response')
logit.predict[1:10]
length(logit.predict)
logit.pred = rep("Down", 998)
logit.pred[logit.predict > 0.5] = "Up"

table(logit.pred, Smarket.train$Direction) # cross table of prediction and real direction

