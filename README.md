# Titanic_Machine-Learning-from-Disaster
Predicting the Survival Rate of Passengers and Justifying the Accuracy of the Model

OPERATIONS  PERFORMED :

1)set.seed(678)

library(tree)
dataset_titanic<- read.csv(file.choose())
View(dataset_titanic)

![image](https://user-images.githubusercontent.com/70339272/122872815-9a9fb600-d34e-11eb-9900-3ccf635d636e.png)



2)head(dataset_titanic)

3)tail(dataset_titanic)

4)shuffle_index <- sample(1:nrow(dataset_titanic))
head(shuffle_index)

[1] 215   13 1036  355  146 1234


5)dataset_titanic <- dataset_titanic[shuffle_index, ]
head(dataset_titanic)

6)library(dplyr)
clean_titanic <- select(.data = dataset_titanic , -c("home.dest", "cabin", "name", "x", "ticket"))
View(clean_titanic)

![image](https://user-images.githubusercontent.com/70339272/122873374-4f39d780-d34f-11eb-9aed-76ba3ad46952.png)


7)clean_titanic<- mutate(.data = clean_titanic, pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')), survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes')))
na.omit(clean_titanic)

8)View(clean_titanic)
glimpse(clean_titanic)

![image](https://user-images.githubusercontent.com/70339272/122873524-80b2a300-d34f-11eb-9ec8-b0aed23dd889.png)


Rows: 1,309
Columns: 8

9)clean_titanic<- select(.data = clean_titanic, -c("age"))
n<- nrow(clean_titanic)
n1<- floor(0.8 * n)
n2<- n - n1
n2

[1]262

10)train<- sample(1:n , n1)
data_train<- clean_titanic[train, ]
data_test<- clean_titanic[-train, ]

dim(data_train)

[1]1047    7



11)dim(data_test)

[1]262   7


12)prop.table(table(data_train$survived))

No       Yes 
0.6265521 0.3734479


13)prop.table(table(data_test$survived))

No       Yes 
0.5839695 0.4160305


14)library(rpart)
install.packages("rpart.plot")
library(rpart.plot)
fit<- rpart(survived~., data = data_train, method = "class")


15)rpart.plot(fit, extra = 101)

![image](https://user-images.githubusercontent.com/70339272/122873603-97f19080-d34f-11eb-91d9-429a16cea1e4.png)

16)rpart.plot(fit, extra = 106)

![image](https://user-images.githubusercontent.com/70339272/122873643-a475e900-d34f-11eb-950e-40b0f560bd3a.png)


17)predict1<- predict(fit, data_train, type = "class")
m<- cbind(data_train$survived, predict1)
table_combine<- table(data_train$survived, predict1)
table_combine


predict1
       No Yes
  No  607  49
  Yes  63 328


18)View(m)

![image](https://user-images.githubusercontent.com/70339272/122873691-b5265f00-d34f-11eb-958a-72bd2c76daeb.png)



