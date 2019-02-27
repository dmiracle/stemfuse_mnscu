#Example 1

grades=c(70,81,85,92,95,63)
bootsample=sample(grades, replace=TRUE)
bootsample
mean(bootsample)

#Example 2

bootmean=NULL
grades=c(70,81,85,92,95,63)
for (i in 1:100){
  bootsample=sample(grades, replace=TRUE)
  bootsample
  bootmean[i]=mean(bootsample)
}
hist(bootmean, breaks=6, xlim=c(70,95))
plot(density(bootmean), type="l")

#Example 3
bootmean=NULL
grades=c(70,81,85,92,95,63)
for (i in 1:100){
  bootsample=sample(grades, replace=TRUE)
  bootsample
  bootmean[i]=mean(bootsample)
  
}
mean(grades)
sd(bootmean)


#Example 4

library(Lock5Data)
attach(CommuteAtlanta)
boot.dist=NULL
for( i in 1:10000){
  boot.sample=sample(500,replace=TRUE)
  boot.dist[i]=mean(Time[boot.sample])
}
hist(boot.dist)
quantile(boot.dist,c(0.05,0.95))

#Example 5

library(boot)
library(ISLR)
sumvar=function(data,index){
  X=data$X[index]
  Y=data$Y[index]
  return (var(X)+var(Y)+2*cov(X,Y))
  
}
sumvar(Portfolio,1:100)
boot(Portfolio,sumvar,R=1000)

#The following listing provides a function (called shrinkage()) for 
#cross-validating a model's R-square statistic using k-fold cross-validation:
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

#This code creates a data frame called states:
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])

#Figure 5 Code
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
summary(fit)

#Figure 6 Code
fit <- lm(Murder ~ Population + Income + Illiteracy + Frost, data=states)
shrinkage(fit)

#Figure 7 Code
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)
shrinkage(fit2)

#The following code demonstrates use of the cv.glm function:
library(boot)
# refit fit using glm instead of lm
fit_glm <- glm(Murder ~ Population + Income + Illiteracy + Frost,
               data=states, family=gaussian(link="identity"))

# ensure it gives the same results as lm
identical(coef(fit), coef(fit_glm))

# run the cross-validation with 10 folds
fitcv1 <- cv.glm(states, fit_glm, K=10)
# check the error
fitcv1$delta

#Another example using cv.glm
# refit the fit2 model using glm
fit2_glm <- glm(Murder ~ Population + Illiteracy, data=states)

# run cross-validation
fitcv2 <- cv.glm(states, fit2_glm, K=10)

# build a data.frame of the results
cvResults <- as.data.frame(rbind(fitcv1$delta, fitcv2$delta))

# give better column names
names(cvResults) <- c("Error", "Adjusted.Error")
# Add model name
cvResults$Model <- sprintf("fitcv%s", 1:2)

# check the results
cvResults

#Figure 8 Code
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