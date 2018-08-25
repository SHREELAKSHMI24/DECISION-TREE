rm(list=ls())
data=read.csv("file:///H:/MY R WORK/2/glass.csv",header=T)

#missing value analysis using builtin logical r function
sum(is.na(data))

#outlier analysis using boxplot
boxplot(data)

#removing outlier using boxplot
for(i in 1:ncol(data[1:10])){
  val=data[,i][data[,i]%in%boxplot.stats(data[,i])$out]
  data=data[which(!data[,i]%in% val),]
}
boxplot(data)

#standardization and normalization using clustersim

install.packages("clusterSim")
library(clusterSim)
norm_data=data.Normalization(data,type="n4",normalization="column")
std_data=data.Normalization(data, type="n1", normalization = "column")



 #convert char to factor
data$Typec[data$Type <= 1]="a" #a=building_windows_float_processed
data$Typec[data$Type >1 & data$Type<=2]="b" #b = building_windows_non_float_processed
data$Typec[data$Type >2 & data$Type<=3]="c" #c = vehicle_windows_float_processed 
data$Typec[data$Type >3 & data$Type<=4]="d" #d = vehicle_windows_non_float_processed
data$Typec[data$Type >4 & data$Type<=5]="e" #e = containers
data$Typec[data$Type >5 & data$Type<=6]="f" #f = tableware
data$Typec[data$Type >6 & data$Type<=7]="g" #g =  headlamps 
  
  
str(data)
is.character(data$Typec)
data$Typec=as.factor(data$Typec)
is.factor(data$Typec)
str(data)

#delet the unwanted variable
install.packages("dplyr")
library(dplyr)
data <- select(data, -Type)
str(data)

#decision tree using c5.0

install.packages("C50")
library(C50)
#divide train and test

traind=data[sample(nrow(data),80,replace=F),]

testd=data[!(1:nrow(data))%in%as.numeric(row.names(traind)),]

#build model
library(caret)
mod = C5.0(traind[,-10],traind[,10])
summary(mod)
plot(mod)
test_model=predict(mod,testd,type="class")
test_model

#summary of model using confusion matrix

xtab=table(observed=testd[,10],predict=test_model)
xtab
confusionMatrix(xtab)  #got 0.8431 accuracy

#adding trials to improve accuracy
mod = C5.0(traind[,-10],traind[,10],trials = 20)
summary(mod)
plot(mod)

test_model=predict(mod,testd,type="class")
test_model

xtab=table(observed=testd[,10],predict=test_model)
xtab
confusionMatrix(xtab) #got 0.9218 accuracy


