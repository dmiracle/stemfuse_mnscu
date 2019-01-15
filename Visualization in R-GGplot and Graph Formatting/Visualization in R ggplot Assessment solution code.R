#Learning Objective One Assessment
library(ggplot2)
ggplot(data=Orange, aes(x=age, y=circumference, color=Tree)) +
  geom_point(size=3) +
  labs(title="Orange Tree Circumference and Age",
       x="Age", y="Circumference")

#Learning OBjective Two Assessment
par(mfrow=c(1,2))
boxplot(mtcars$mpg~mtcars$cyl, main="MPG for each cylinder type",xlab="Number of cylinders",cex.main=0.8)
meanmpg=tapply(mtcars$mpg,mtcars$cyl,mean)
barplot(meanmpg, main="Mean MPG for each cylinder type",xlab="Number of cylinders",cex.main=0.8)

#Learning OBjective Three Assessment
par(mfrow=c(1,2))
boxplot(mtcars$mpg~mtcars$cyl, xlab="Number of cylinders",col=c("red","blue","yellow"))
title("MPG for each cylinder type",cex.main=0.8)
meanmpg=tapply(mtcars$mpg,mtcars$cyl,mean)
barplot(meanmpg, xlab="Number of cylinders",col=c("red","blue","yellow"))
title("Mean MPG for each cylinder type",cex.main=0.8)
legend(x="topright", legend=c("4 cylinders","6 cylinders","8 cylinders"),cex=0.5, pch=c(16,16,16), col=c("red","blue","yellow"))

#Learning Objective Four Assessment

Tree=ordered(Orange$Tree,levels=c(1,2,3,4,5))
boxplot(Orange$circumference~Tree,col=c("red","green","blue","yellow","gold"), xlab="Trees",ylab="Circumference")
legend(x="topleft",legend=c("Tree1","Tree2","Tree3","Tree4","Tree5"),cex=0.8,pch=16,col=c("red","green","blue","yellow","gold"))
title("Orange Tree Circumferences")

#Learning Objective Five Assessment

dev.off()
boxplot(ToothGrowth$len~ToothGrowth$supp,xlab="Supplement",ylab="Tooth Length")
text(1,20, labels="Highest Median")
