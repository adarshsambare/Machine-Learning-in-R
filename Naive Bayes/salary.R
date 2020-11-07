#Reading the data
library(readr)
salary_train <- read.csv(choose.files()) #choose training data
salary_test <- read.csv(choose.files()) #choose testing data

#view the data
View(salary_test)
View(salary_train)
str(salary_train)

#converting into factors  
#salary_test[,c(2,3,5,6,7,8,9,13,14)]<- as.factor(salary_test[,c(2,3,5,6,7,8,9,13,14)])
#funciton for converting into factore

salary_train$workclass <- as.factor(salary_train$workclass) 
salary_test$workclass <- as.factor(salary_test$workclass)

salary_train$education <- as.factor(salary_train$education)
salary_test$education <- as.factor(salary_test$education)

salary_test$maritalstatus <- as.factor(salary_test$maritalstatus)
salary_train$maritalstatus <- as.factor(salary_train$maritalstatus)

salary_test$occupation<- as.factor(salary_test$occupation)
salary_train$occupation<- as.factor(salary_train$occupation)

salary_test$relationship<- as.factor(salary_test$relationship)
salary_train$relationship<- as.factor(salary_train$relationship)

salary_test$race <- as.factor(salary_test$race)
salary_train$race<- as.factor(salary_train$race)

salary_test$sex<- as.factor(salary_test$sex)
salary_train$sex <- as.factor(salary_train$sex)

salary_test$native<- as.factor(salary_test$native)
salary_train$native<- as.factor(salary_train$native)

salary_test$Salary<- as.factor(salary_test$Salary)
salary_train$Salary<- as.factor(salary_train$Salary)

#writing a naive bayes model
library(e1071)
model<-naiveBayes(salary_train$Salary~.,data=salary_train)
pred<-predict(model,newdata = salary_test[,-1])

table(pred)
table(salary_test$Salary)

table(pred,salary_test$Salary)
#using laplase smoothing
model1 <- naiveBayes(salary_train$Salary~., data = salary_train, laplace = 8)
pred1<-predict(model1,newdata = salary_test[,-1])

table(pred,salary_test$Salary)
table1(pred1,salary_test$Salary)
##as the data is highly biased towards <= 50k our model will be baised towards it

#checking the accuracy 
accuracy1 <- ((sum(diag(table)))/(sum(table)))
accuracy2 <-(sum(diag(table1)))/(sum(table1))

