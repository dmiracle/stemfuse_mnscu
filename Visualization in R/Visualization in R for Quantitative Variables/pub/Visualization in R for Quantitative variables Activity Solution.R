#Activity 1
weight=c(0.3,0.4,0.5,0.5,1.0,0.7)
price=c(510,1151,1343,1410,5669,2277)
plot(weight,price, main="Relationship between Diamond Price and Weight")

#Activity 2
sunflowerplot(Orange$age,Orange$circumference,col="blue",seg.col="green")

#Activity 3
require(corrplot)
irisnew=data.frame(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,iris$Petal.Width)
iriscor=cor(irisnew)
corrplot(iriscor, method="ellipse")

#Activity 4
boxplot(len~dose, data=ToothGrowth, col=c("gold","blue","pink"), main="Tooth Growth")

#Activity 5
hist(iris$Sepal.Length)
hist(iris$Sepal.Length, breaks=c(seq(4,8,0.4)), col="red", border="purple")

#Activity 6
year=c(1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005)
fatalities=c(140,170,169,145,158,162,240,161,150,170,165)
plot(year, fatalities, xlim=c(1995,2005),ylim=c(0,240))
lines(year,fatalities)

#Activity 7
attach(mtcars)
require(aplpack)
bagplot(wt, mpg, main="Relationship between weight and MPG",xlab="Weight", ylab="Miles per Gallon")