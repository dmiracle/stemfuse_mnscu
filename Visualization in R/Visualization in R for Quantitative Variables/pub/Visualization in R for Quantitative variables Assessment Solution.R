#Learning Objective One Assessment One
SBP=c(132,143,153,137,162,154,168,149,159,128,166)
age=c(52,59,67,54,73,64,74,61,65,46,72)
gender=c("male","female","female","male","male","male","male","male","female","female","female")
bloodpressure=data.frame(SBP,age,gender)
bloodpressure
plot(bloodpressure$SBP,bloodpressure$age,pch=21,bg=c("red","blue")[unclass(bloodpressure$gender)])

#Learning Objective One Assessment Two
Immunization<-c(77,32,94,99,89,13,91,47,76)
Mortality<-c(118,184,43,12,55,208,33,145,87)
plot(Immunization, Mortality,pch=16,col="blue", main="Relationship between immunization and mortality")

#Learning Objective Two Assessment

sunflowerplot(Orange$age,Orange$circumference)
#The plot shows three repeated individuals

#Learning Objective Three Assessment

require(corrplot)
aircor=cor(airquality)
corrplot(aircor,method="ellipse")

#Learning Objective Four Assessment One

grades=c(72,83,95,75,78,86,88,93,75,89,85,97)
boxplot(grades,boxwex=0.4, main="Students Grades", ylab="Grade")

#Learning Objective Four Assessment Two

boxplot(ToothGrowth$len~ToothGrowth$supp,xlab="Supplement",ylab="Tooth Length")

#Learning Objective Five Assessment

grades=c(72,83,95,75,78,86,88,93,75,89,85,97)
hist(grades,breaks=c(70,80,90,100),xlim=c(70,100),border="black",col="grey",xlab="Grades",ylab="Frequencies")
title("Student grades")

#Learning Objective Six Assessment

year<-c(2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010)
mortalityrate<-c(9.5,8,8.1,7.6,6.9,5.1,3.2,2.1,2.5,1.1,0.9)
plot(year,mortalityrate,type="b",ylab="Mortality Rate (in 1000 births)")

#Learning Objective Seven Assessment

require(aplpack)
bagplot(Orange$age,Orange$circumference,xlab="Miles per Gallon", ylab="weight (in tons)")
