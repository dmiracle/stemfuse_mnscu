#Figure 1 Code
head(state.x77) 


#Figure 2 Code
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])


#Figures 3 and 4 Code
cor(states)
library(car)
scatterplotMatrix(states, spread=FALSE, smoother.args=list(lty=2),
                  main="Scatterplot Matrix")


#Figures 5, 6, and 7 Code
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,
          data=states)
summary(fit)


#Figure 8 Code
confint(fit)


#Figure 9 Code
library(MASS)
?survey
survmult <- lm(Height ~ Wr.Hnd + Sex, data = survey)
summary(survmult)


#Figure 10 Code
predict(survmult,newdata=data.frame(Wr.Hnd=16.5,Sex="Male"),
        interval = "confidence", level=0.95)


#Figure 11 Code
predict(survmult,newdata=data.frame(Wr.Hnd=13,Sex="Female"),
        interval="prediction", level=0.99)


#Figures 12 and 13 Code
plot(survey$Height~survey$Wr.Hnd,
     col=c("gray","black")[as.numeric(survey$Sex)],
     pch=16,xlab="Writing handspan",ylab="Height")
survcoefs <- coef(survmult)
survcoefs
as.numeric(survcoefs[1]+survcoefs[3])
abline(a=survcoefs[1],b=survcoefs[2],col="gray",lwd=2)
abline(a=survcoefs[1]+survcoefs[3],b=survcoefs[2],col="black",lwd=2)
legend("topleft",legend=levels(survey$Sex),col=c("gray","black"),pch=16)


#Figure 14 Code
survey[survey$Sex=="Female" & survey$Wr.Hnd==13,c("Sex","Wr.Hnd","Height")]


#Figure 15 Code
fit_interaction <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit_interaction)


#Figures 16 and 17 Code
library(effects) 
plot(effect("hp:wt", fit_interaction,, list(wt=c(2.2,3.2,4.2))), multiline=TRUE)


#Figure 18 Code
class(survey$Sex)
table(survey$Sex)


#Figures 19 and 20 Code
plot(survey$Height ~ survey$Sex)


#Figure 21 Code
survfit2 <- lm(Height ~ Sex, data=survey)
summary(survfit2)


#Figure 22 Code
extra.obs <- factor(c("Female","Male","Male","Male","Female"))
extra.obs


#Figure 23 Code
predict(survfit2,newdata=data.frame(Sex=extra.obs),interval="confidence",
        level=0.9)


#Figure 24 Code
summary(survmult)


#Figure 25 Code
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=states) 
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)
anova(fit2, fit1)


#Figure 26 Code
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=states)
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)
AIC(fit1,fit2)


#Figure 27 Code
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,
          data=states)
stepAIC(fit, direction="backward")


#Figures 28-30 Code
library(leaps)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
leaps <- regsubsets(Murder ~ Population + Illiteracy + Income +
                      Frost, data=states, nbest=4)
plot(leaps, scale="adjr2")
library(car)
subsets(leaps, statistic="cp",
        main="Cp Plot for All Subsets Regression")
abline(1,1,lty=2,col="red")


#Figure 31 Code
library(car)
vif(fit)


#Figure 32 Code
cor(states)