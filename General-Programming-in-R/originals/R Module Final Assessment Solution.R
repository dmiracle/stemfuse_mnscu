#Question 1
library(MASS)
A=matrix(c(3,6,7,12,5,9,-1,6,-7),nrow=3,byrow=TRUE)
B=matrix(c(2,12,15,7,11,13,9,22,16),nrow=3,byrow=TRUE)

A
B
t(A)
A%*%B

#Question 2
Name<-c("Jack","Peter","Julie","Mary")
Gender<-c("Male","Male","Female","Female")
Date<-as.Date(c("2010-11-1","2012-1-12","2013-3-2","2014-10-8"))
Salary<-c(56000,49000,32000,30000)
Age<-c(51,39,41,28)
homeworkdata=data.frame(Name,Gender,Date,Salary,Age)
homeworkdata

#Question 3
mydata<-write.csv(homeworkdata,file="C:/Users/jx0848tg/Desktop/myhomeworkdata.csv")

#Question 4

patient<-function (baseline, followup) {
  
  if (baseline>followup) {
    result<-"recovered"
  }
  else if (baseline<followup){
    result<-"more treatment"
  }
  else {
    result<-"no further treatment needed"
  }
  return (result)
}

baseline<-c(100,110,109,99,103,101,125,130,135)
followup<-c(110,100,112,105,100,121,110,120,109)

treatmentplan<-NULL
for (i in 1:8) {
  treatmentplan[i]<-patient(baseline[i], followup[i])
}

#Question 5a)
mysample<-sample(airquality$Temp,50)
mysample

#Question 5b)
x=mean(mysample)
x

#Question 5c)

y=NULL
for (i in 1:1000){
  mysample<-sample(airquality$Temp,50)
  y[i]=mean(mysample)
  
}
y
hist(y)

#Question 6
solar.radiation <- c(11.1, 10.6, 6.3, 8.8, 10.7, 11.2, 8.9, 12.2)
mean(solar.radiation)
median(solar.radiation)
range(solar.radiation)
var(solar.radiation)
sr10 <- solar.radiation + 10
sr10
mean(sr10)
median(sr10)
range(sr10)
var(sr10)
srm2 <- solar.radiation * -2
mean(srm2)
median(srm2)
range(srm2)
var(srm2)


#Question 7
mean(USArrests[(which(USArrests$UrbanPop > 77)),1])
mean(USArrests[(which(USArrests$UrbanPop < 50)),1])
index <- sample(x=1:nrow(USArrests), size=12, replace=FALSE)
index
newdf <- USArrests[index,]
newdf


#Question 8
beaver1$id <- 1
beaver2$id <- 2
both_beavers <- rbind(beaver1, beaver2)
both_beavers
subset(both_beavers, as.logical(activ))


#Question 9
sd(0:100)


#Question 10
bar <- c(8,8,4,4,5,1,5,6,6,8)
bar <= 6 & bar != 4


#Question 11
Temp_F <- c(45,77,20,19,101,120,212)
Temp_C <- (5/9) * (Temp_F - 32)
Temp_C


#Question 12
person <- c("Stan", "Francine", "Steve", "Roger", "Hayley", "Klaus")
sex <- c("M", "F", "M", "M", "F", "M")
funny <- c("High", "Med", "Low", "High", "Med", "Med")
dframe <- data.frame(person, sex, funny)
dframe
age <- c(41, 41, 15, 106, 21, 60)
dframe <- data.frame(dframe,age)
dframe
dframe[which(dframe$sex == "F" & (dframe$funny == "Med" | dframe$funny == "High")),
       c("person", "age")]