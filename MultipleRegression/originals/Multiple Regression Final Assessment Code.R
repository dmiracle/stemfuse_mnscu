#Final Assessment #1 Code
mtcars
?mtcars
cor(mtcars)
library(car)
scatterplotMatrix(mtcars, spread=FALSE, smoother.args=list(lty=2),
                  main="Scatterplot Matrix")


#Final Assessment #2 Code
fit_mpg1 <- lm(mpg ~ hp + wt, data=mtcars)
summary(fit_mpg1)


#Final Assessment #3 Code
confint(fit_mpg1, level=0.95)


#Final Assessment #4 Code
predict(fit_mpg1, newdata=data.frame(hp=175,wt=3.5),
        interval = "confidence", level=0.99)


#Final Assessment #5 Code
predict(fit_mpg1, newdata=data.frame(hp=175,wt=3.5),
        interval = "prediction", level=0.99)


#Final Assessment #6 Code
library(MASS)
cats
?cats
fit_interaction_cats <- lm(Hwt ~ Sex + Bwt + Sex:Bwt, data = cats)
summary(fit_interaction_cats)


#Final Assessment #7 Code
library(effects)
plot(effect("Sex:Bwt", fit_interaction_cats,, list(Sex=c("M","F"))),
     multiline=TRUE)


#Final Assessment #8 Code
predict(fit_interaction_cats, newdata=data.frame(Sex="M",Bwt=3.8),
        interval = "prediction", level=0.99)


#Final Assessment #9 Code
fit_cats <- lm(Hwt ~ Sex + Bwt, data = cats)
anova(fit_cats, fit_interaction_cats)


#Final Assessment #10 Code
AIC(fit_cats, fit_interaction_cats)


#Final Assessment #11 Code
fit_mtcars_full <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear +
                        carb, data = mtcars)
stepAIC(fit_mtcars_full, direction="forward")
stepAIC(fit_mtcars_full, direction="backward")
stepAIC(fit_mtcars_full, direction="both")


#Final Assessment #12 Code
library(leaps)
leaps <- regsubsets(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear +
                      carb, data=mtcars, nbest=3)
plot(leaps, scale="adjr2")
library(car)
subsets(leaps, statistic="cp",
        main="Cp Plot for All Subsets Regression")
abline(1,1,lty=2,col="red")


#Final Assessment #13 Code
vif(fit_mtcars_full)


#Final Assessment #14 Code
cor(mtcars)