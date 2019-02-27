#Homework 1a)
ants<-c(43,59,22,25,36,47,19,21)
ants
mean(ants)
sd(ants)

#Homework 1b)
antmean=NULL
for ( i in 1:60){
  antsample<-sample(ants,replace=TRUE)
  antmean[i]<-mean(antsample)
}

#Homework 1c)
hist(antmean)
mean(antmean)
sd(antmean)

#The distribution is normal; the mean of the distribution is 34.11, and the standard deviation is 4.90

#Homework 2a) 

library(MASS)
attach(Boston)
crimemean=NULL
for (i in 1:1000){
  
  crimesample=sample(Boston$crim,replace=TRUE)
  crimemean[i]=mean(crimesample)
}

#Homework 2b)
quantile(crimemean,c(0.005,0.995))

#Homework 3a)
bootsample=sample(airquality$Temp,replace=TRUE)
bootsample

#Homework 3b)
tempmean=NULL
x=mean(airquality$Temp)
x
for (i in 1:1000){
  
  tempsample=sample(airquality$Temp,replace=TRUE)
  tempmean[i]=mean(tempsample)
}

hist(tempmean)

#Homework 3c)
s=sd(tempmean)
s

#Homework 3d)
#The 95% CI is (x-1.96*s, x+1.96*s)=(76.39,79.37)

#Homework 4a)
p=(4*5*5*5*5)/(5^5)
p

#Homeowrk 4b)
Q=(5^4)/(5^5)
Q

#Homework 5a)
y=sd(mtcars$mpg)
y

#Homework 5b)
sdmpg=NULL
for(i in 1:100){
  mpgsample=sample(mtcars$mpg,replace=TRUE)
  sdmpg[i]=sd(mpgsample)
}

hist(sdmpg)

#Homework 5c)
quantile(sdmpg, c(0.01,0.99))

#Homework 6
library(MASS)
cats
?cats
cats$Sex <- as.numeric(cats$Sex)

shrinkage <- function(fit, k=10) {
  require(bootstrap)
  
  theta.fit <- function(x,y){lsfit(x,y)}
  theta.predict <- function(fit,x){cbind(1,x)%*%fit$coef}
  
  x <- fit$model[,2:ncol(fit$model)]
  y <- fit$model[,1]
  
  results <- crossval(x, y, theta.fit, theta.predict, ngroup=k)
  r2 <- cor(y, fit$fitted.values)^2
  r2cv <- cor(y, results$cv.fit)^2
  cat("Original R-square =", r2, "\n")
  cat(k, "Fold Cross-validated R-square =", r2cv, "\n")
  cat("Change =", r2-r2cv, "\n")
}

fit <- lm(Hwt ~ Sex + Bwt, data=cats)
summary(fit)
shrinkage(fit)

#Homework 7
fit2 <- lm(Hwt ~ Sex + Bwt + Sex:Bwt, data=cats)
summary(fit2)
shrinkage(fit2)

#Homework 8
library(boot)
# refit fit using glm instead of lm
fit_glm <- glm(Hwt ~ Sex + Bwt, data=cats,
               family=gaussian(link="identity"))

# ensure it gives the same results as lm
identical(coef(fit), coef(fit_glm))

# run the cross-validation with 10 folds
fitcv1 <- cv.glm(cats, fit_glm, K=10)
# check the error
fitcv1$delta

#Homework 9
# visualize the results
# measure with AIC
cvResults$AIC <- AIC(fit_glm, fit2_glm)$AIC

# make the data.frame suitable for plotting
library(reshape2)
cvMelt <- melt(cvResults, id.vars="Model", variable,name="Measure",
               value.name="Value")
cvMelt

library(ggplot2)
ggplot(cvMelt, aes(x=Model, y=Value)) +
  geom_line(aes(group=Measure, color=Measure)) +
  facet_wrap(~Measure, scales="free_y") +
  theme(axis.text.x=element_text(angle=90, vjust=.5)) +
  guides(color=FALSE)