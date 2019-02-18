#Activity 1 Code
library(boot)
nuclear
?nuclear
cor(nuclear)
library(car)
scatterplotMatrix(nuclear, spread=FALSE, smoother.args=list(lty=2),
                  main="Scatterplot Matrix")


#Activity 2 Code
fit_nuclear <- lm(cost ~ t1 + t2, data=nuclear)
summary(fit_nuclear)


#Activity 3 Code
confint(fit_nuclear, level=0.99)


#Activity 4 Code
predict(fit_nuclear,newdata=data.frame(t1=18,t2=70),
        interval="confidence", level=0.98)


#Activity 5 Code
predict(fit_nuclear,newdata=data.frame(t1=18,t2=70),
        interval="prediction", level=0.98)


#Activity 6 Code
trees
head(trees)
fit_interaction_trees <- lm(Volume ~ Girth + Height + Girth:Height, data=trees)
summary(fit_interaction_trees)


#Activity 7 Code
library(effects)
plot(effect("Girth:Height", fit_interaction_trees,, list(Height=c(65,75,85))),
     multiline=TRUE)


#Activity 8 Code
library(MASS)
cats
?cats
fit_cats <- lm(Hwt ~ Sex + Bwt, data=cats)
summary(fit_cats)
predict(fit_cats,newdata=data.frame(Sex="F",Bwt=3.4),interval="prediction",
        level=0.95)


#Activity 9 Code
fit_nuclear_1 <- lm(cost ~ t1 + t2, data=nuclear)
fit_nuclear_2 <- lm(cost ~ t1 + t2 + date, data=nuclear)
anova(fit_nuclear_1, fit_nuclear_2)


#Activity 10 Code
AIC(fit_nuclear_2, fit_nuclear_1)


#Activity 11 Code
fit_nuclear_full <- lm(cost ~ date + t1 + t2 + cap + pr + ne + ct + bw + cum.n +
                         pt, data=nuclear)
stepAIC(fit_nuclear_full, direction="forward")
stepAIC(fit_nuclear_full, direction="backward")
stepAIC(fit_nuclear_full, direction="both")


#Activity 12 Code
library(leaps)
leaps <- regsubsets(cost ~ date + t1 + t2 + cap + pr + ne + ct + bw + cum.n +
                      pt, data=nuclear, nbest=5)
plot(leaps, scale="adjr2")
library(car)
subsets(leaps, statistic="cp",
        main="Cp Plot for All Subsets Regression")
abline(1,1,lty=2,col="red")


#Activity 13 Code
library(car)
vif(fit_nuclear_full)


#Activity 14 Code
cor(nuclear)