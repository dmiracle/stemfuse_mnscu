#Activity 1

bootsample=sample(mtcars$mpg,replace=TRUE)
bootsample

mpgmean=NULL
for(i in 1:1000){
  bootmpg=sample(mtcars$mpg,replace=TRUE)
  mpgmean[i]=mean(bootmpg)
}
mpgmean
hist(mpgmean,xlim=c(15,25))

#The distribution of the bootstrap sample mean is normal;
#The approximate mean is 20
#It is almost the same as the mean mpg of the original sample, 20.09

#Activity 2

x<-read.csv("http://www.stat.umn.edu/geyer/3701/data/boot1.csv")
x=as.vector(x)
mu.star=NULL

for (i in 1:1000){
  
  xstar=sample(x$x,replace=TRUE)
  mu.star[i]<-mean(xstar)
  
}

hist(mu.star,breaks=10)

# It is a normal distribution

#Activity 3

price=c(19.95,24.99,39.99,34.99,30.99,92.5,
        84.99,119.99,19.99,114.99,44.99,50,84.99,
        29.91,159.99,61.99,25,27.5,84.99,199)
pricemean=NULL

for(i in 1:50){
  
  pricesample=sample(price,replace=TRUE)
  pricemean[i]=mean(pricesample)
  
}
hist(pricemean)
mean(price)
sd(pricemean)

#The confidence interval is mean+-1.96*sd

#Activity 4

library(Lock5Data)
attach(CommuteAtlanta)
boot.dist=NULL
for( i in 1:1000){
  boot.sample=sample(500,replace=TRUE)
  boot.dist[i]=cor(Distance[boot.sample],Time[boot.sample])
}
hist(boot.dist)
quantile(boot.dist,c(0.02,0.98))

#Activity 5

tstatistic=function(mtcars,mu){

  xbar=mean(mtcars$mpg)
  numerator=xbar-mu
  denominator=sd(mtcars$mpg)/sqrt(32)
  tstat=numerator/denominator
  return(tstat)
}

tstatistic(mtcars,25)

boot(mtcars,tstatistic,R=1000)

#Activity 6
library(boot)
?nuclear

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
  cat(k, "Fold Cross-Validated R-square =", r2cv, "\n")
  cat("Change =", r2-r2cv, "\n")
}

fit <- lm(cost ~ t1 + t2, data=nuclear)
summary(fit)
shrinkage(fit)

#Activity 7
fit2 <- lm(cost ~ t1 + t2 + date, data=nuclear)
shrinkage(fit2)

#Activity 8
# refit fit using glm instead of lm
fit_glm <- glm(cost ~ t1 + t2, data=nuclear,
               family=gaussian(link="identity"))

# ensure it gives the same results as lm
identical(coef(fit), coef(fit_glm))

# run the cross-validation with 10 folds
fitcv1 <- cv.glm(nuclear, fit_glm, K=10)
# check the error
fitcv1$delta

# refit the fit2 model using glm
fit2_glm <- glm(cost ~ t1 + t2 + date, data=nuclear)

# run cross-validation
fitcv2 <- cv.glm(nuclear, fit2_glm, K=10)

# build a dat.frame of the results
cvResults <- as.data.frame(rbind(fitcv1$delta, fitcv2$delta))

# give better column names
names(cvResults) <- c("Error", "Adjusted.Error")
# Add model name
cvResults$Model <- sprintf("fitcv%s", 1:2)

# check the results
cvResults

# Activity 9
# visualize the results
# measure with AIC
cvResults$AIC <- AIC(fit_glm, fit2_glm)$AIC

# make the data.frame suitable for plotting
library(reshape2)
cvMelt <- melt(cvResults, id.vars="Model", variable.name="Measure",
               value.name="Value")
cvMelt

library(ggplot2)
ggplot(cvMelt, aes(x=Model, y=Value)) +
  geom_line(aes(group=Measure, color=Measure)) +
  facet_wrap(~Measure, scales="free_y") +
  theme(axis.text.x=element_text(angle=90, vjust=.5)) +
  guides(color=FALSE)