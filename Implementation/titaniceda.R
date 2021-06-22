library(ggplot2)

titanic<-read.csv(file.choose())
dim(titanic)
names(titanic)
str(titanic)
attributes(titanic)
titanic[1:5,]
titanic[1:10,"name"]
titanic$survived[1:10]
summary(titanic)
table(titanic$sex)
barplot(table(titanic$sex), col = rgb(0.2,0.6,0.3))
tbl<-with(titanic,table(survived,sex))
barplot(tbl,beside= TRUE,legend=TRUE)
plot(density(titanic$age))
table(titanic$age)
N1 <-c(titanic$age)
N2 <- gsub(",","",N1)
as.numeric(N2)

pie(table(titanic$pclass))
#var(titanic$age)
#cov(titanic$age,titanic$fare)
#cor(iris$SepalLengthCm,iris$PetalLengthCm)
hist(titanic$sex)
boxplot(age ~ sex,data=titanic,xlab="age",ylab ="sex")



#barplot(titanic,table(survived))
