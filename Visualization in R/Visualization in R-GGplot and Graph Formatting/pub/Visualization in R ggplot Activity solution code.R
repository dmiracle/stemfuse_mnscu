#Activity One

library(ggplot2)
mtcars$am <- factor(mtcars$am, levels=c(0,1),
                    labels=c("Automatic", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels=c(0,1),
                    labels=c("V-Engine", "Straight Engine"))
mtcars$cyl <- factor(mtcars$cyl)
ggplot(data=mtcars, aes(x=hp, y=mpg,
                        shape=cyl, color=cyl)) +
  geom_point(size=3) +
  facet_grid(am~vs) +
  labs(title="Automobile Data by Engine Type",
       x="Horsepower", y="Miles Per Gallon")

#Activity Two
dev.off()
par(mfrow=c(1,2))
par(col="blue")
plot(iris$Sepal.Length,iris$Sepal.Width,xlab="Length", ylab="Width", main="Sepal Length vs. Sepal Width")
plot(iris$Petal.Length,iris$Petal.Width, xlab="Length", ylab="Width", main="Petal Length vs. Petal Width")

#Activity Three
dev.off()
plot(iris$Petal.Length,iris$Petal.Width,pch=15, col.main="red", col.axis="red",main="Petal length vs. Petal width",xlab="Length",ylab="Width",xlim=c(0,7),ylim=c(0,3))

#Activity Four

year2000=c(7,12,28,30,41,39,22,7)
year2010=c(10,9,19,28,32,27,18,3)
month=c("March","April","May","June","July","August","Sep","Oct")
plot(year2000,type="o",col="red",xlab="Month", ylab="Rain Fall Amount",axes=FALSE)
axis(1,at=1:8, labels=month)
axis(2,at=0:40*5)
lines(year2010,type="o",col="green")
legend(x="topright",legend=c("Year 2000","Year 2010"), col=c("red","green"),pch=c(1,1),cex=0.8)
text(5,40,labels="maximum point",cex=1,col="black")

#Activity Five
car=c("BMW","Toyota","Honda","Ford","Volvo")
price=c(52,26,24,22,54)
barplot(price,main="Average Price of Cars",xlab="Cars",ylab="Average Price",axes=FALSE)
axis(1,at=1:5, labels=car)
axis(2,las=0,at=5*0:55)
