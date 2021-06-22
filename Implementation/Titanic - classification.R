# Titanic Data Set Prediction and Analysis


set.seed(678)

library(tree)
dataset_titanic<- read.csv(file.choose())
View(dataset_titanic)

head(dataset_titanic)
tail(dataset_titanic)

shuffle_index <- sample(1:nrow(dataset_titanic))
head(shuffle_index)

dataset_titanic <- dataset_titanic[shuffle_index, ]
head(dataset_titanic)


##  Cleaning the Data set ##

library(dplyr)
clean_titanic <- select(.data = dataset_titanic , 
            -c("home.dest", "cabin", "name", "x", "ticket"))
View(clean_titanic)

clean_titanic<- mutate(.data = clean_titanic, 
  pclass = factor(pclass, levels = c(1, 2, 3), 
  labels = c('Upper', 'Middle', 'Lower')), 
  survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes')))

na.omit(clean_titanic)
View(clean_titanic)
glimpse(clean_titanic)

## Training and testing data set ##

clean_titanic<- select(.data = clean_titanic, -c("age"))
glimpse(clean_titanic)

n<- nrow(clean_titanic)
n1<- floor(0.8 * n)
n2<- n - n1
n2
train<- sample(1:n , n1)
data_train<- clean_titanic[train, ]
data_test<- clean_titanic[-train, ]

dim(data_train)
dim(data_test)

prop.table(table(data_train$survived))
prop.table(table(data_test$survived))

library(rpart)
install.packages("rpart.plot")
library(rpart.plot)

fit<- rpart(survived~., data = data_train, method = "class")
rpart.plot(fit, extra = 101)
rpart.plot(fit, extra = 106)

## Make Predictions ##

predict1<- predict(fit, data_train, type = "class")
m<- cbind(data_train$survived, predict1)
table_combine<- table(data_train$survived, predict1)
table_combine
View(m)
