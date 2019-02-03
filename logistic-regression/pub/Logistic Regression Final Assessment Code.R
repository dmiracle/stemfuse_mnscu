#Final Assessment 1
income <- c(24, 27, 28, 29, 30, 31, 32, 33, 34, 35, 38, 39, 40, 41, 42, 45,
            48, 49, 50, 52, 59, 60, 65, 68, 70, 79, 80, 84, 94, 120, 130)
cases <- c(1, 1, 5, 3, 9, 5, 8, 1, 7, 1, 3, 2, 5, 2, 2, 1, 1, 1, 10,
           1, 1, 5, 6, 3, 5, 1, 1, 1, 1, 6, 1)
credit.cards <- c(0, 0, 2, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 2,
                  0, 0, 2, 6, 3, 3, 0, 0, 0, 0, 6, 1)
study <- data.frame(income, cases, credit.cards)
study
mod.fit <- glm(formula = credit.cards/cases ~ income, weights = cases,
               family = binomial(link = logit), data = study)
summary(mod.fit)
exp(mod.fit$coefficients[2])
exp(10*mod.fit$coefficients[2])
beta.ci <- mod.fit$coefficients[2] + qnorm(p = c(0.025,0.975)) *
  sqrt(vcov(mod.fit)[2,2])
beta.ci

# a.  The etimated logistic regression equation is logit(pi-hat) =
# -3.55611 + 0.5318*income.

# b.  Because there is a positive parameter estimate corresponding to income, 
# the estimated probability of having a travel credit card increases as income
# increases.

# c.  The estimated odds of having a travel credit card multiply by 1.054618
# times for each one million lira increase in annual income.

# d.  The estimated odds of having a travel credit card multiply by 1.701972
# times for each ten million lira increase in annual income.

# e.  The 95% Wald confidence interval for beta_1 is 0.0274 < beta_1 < 0.0789.
# Since the confidence interval does not contain 0, we can conclude that annual
# income has a significant effect on predicting the probability of having a 
# travel credit card.

library(package = car)
Anova(mod = mod.fit, test = "LR")
beta.ci <- confint(object = mod.fit, parm = "income", level = 0.95)
beta.ci
as.numeric(exp(10*beta.ci))

# f.  The 95% profile LR confidence interval for beta_1 is 0.0301 < beta_1 < 0.0819.

# g.  Using a 95% profile LR confidence interval, the odds of owning a travel
# credit card increase by an amount between 1.3518 to 2.2678 times for every 10
# million lira increase in annual income.

# h.  H0:  beta_1 = 0
#     Ha:  beta_1 not equal to 0
#     Test Statistic:  -2log(lambda) = 26.857
#     p-value:  2.191e-07
#     Conclusion:  Since p-value is = 0, there is highly significant evidence that
#     annual income has an effect on predicting the probability of owning a travel
#     credit card.

library(package = mcprofile)
K <- matrix(data = c(1,90), nrow =1, ncol = 2)
K
# Calculate -2log(Lambda)
linear.combo <- mcprofile(object = mod.fit, CM = K)
# CI for beta_0 + beta_1 * x
ci.logit.profile <- confint(object = linear.combo, level = 0.95)
ci.logit.profile
exp(ci.logit.profile$confint) / (1 +
                                   exp(ci.logit.profile$confint))

# i.  The estimated probability of owning a travel credit card when annual income
# is 90 million lira is 0.7738.

# j.  The 95% profile LR confidence interval for pi when annual income is 90
# million lira is 0.5545 < pi < 0.9213.


#Final Assessment 2
#Logistic model
mod.fit <- glm(formula = y ~ x1 + x2, data = tableexample2, family =
                 binomial(link = logit))
summary(mod.fit)
predict.data <- data.frame(x1 = c(4, 6, 8), x2 = c(0, 0, 0))
predict.data
alpha <- 0.05
linear.pred <- predict(object = mod.fit, newdata =
                         predict.data, type = "link", se = TRUE)
linear.pred
exp(-3.280527)/(1+exp(-3.280527))
exp(-2.199816)/(1+exp(-2.199816))
exp(-1.119105)/(1+exp(-1.119105))
CI.lin.pred.4 <- linear.pred$fit[1] + qnorm(p =
                                              c(alpha/2, 1 - alpha/2)) *
  linear.pred$se[1]
CI.lin.pred.6 <- linear.pred$fit[2] + qnorm(p =
                                              c(alpha/2, 1 - alpha/2)) *
  linear.pred$se[2]
CI.lin.pred.8 <- linear.pred$fit[3] + qnorm(p =
                                              c(alpha/2, 1 - alpha/2)) *
  linear.pred$se[3]
round(exp(CI.lin.pred.4) / (1+exp(CI.lin.pred.4)),4) #CI for x1=4 and x2=0
round(exp(CI.lin.pred.6) / (1+exp(CI.lin.pred.6)),4) #CI for x1=6 and x2=0
round(exp(CI.lin.pred.8) / (1+exp(CI.lin.pred.8)),4) #CI for x1=8 and x2=0

# a.  The estimated logistic regression model is logit(pi-hat) =
# -5.4419 + 0.5404x1 + 0.3717x2.

# b.  x1 = 4 and x2 = 0:  pi-hat = 0.0362; 95% Wald CI for pi:  0.0035 < pi < 0.2878
#     x1 = 6 and x2 = 0:  pi-hat = 0.0998; 95% Wald CI for pi:  0.0195 < pi < 0.3823
#     x1 = 8 and x2 = 0:  pi-hat = 0.2462; 95% Wald CI for pi:  0.0467 < pi < 0.6852

library(package = car)
Anova(mod.fit, test = "LR")

# c.  x1, Years of Higher Education:
#     H0:  beta_1 = 0
#     Ha:  beta_1 does not equal 0
#     -2log(Lambda) = 3.0818
#     p-value = 0.079175
#     Conclusion:  Since p-value = 0.079175 > alpha = 0.05, there is insufficient
#     evidence to indicate years of higher education has an effect on the 
#     probability of being hired given years of experience is in the model.

#     x2, Years of Experience
#     H0:  beta_2 = 0
#     Ha:  beta_2 does not equal 0
#     -2log(Lambda) = 6.7524
#     p-value = 0.009362
#     Conclusion:  Since 0.001 < p-value = 0.009362 < alpha = 0.01, there is
#     significant evidence to indicate that years of experience has an effect on
#     the probability of being hired given years of higher education is in the
#     model.

# d.  Since x1 (years of higher education) is not significant, we should consider
#     excluding it.  We should consider only a model with x2 (years of experience):
#     logit(pi) = beta_0 + beta_1x2.

mod.fit2 <- glm(formula = y ~ x2, data = tableexample2, family =
                  binomial(link = logit))
summary(mod.fit2)

# e.  The estimated logistic regression model is logit(pi-hat) = -2.1325 + 
#     0.3219x2.

# f.  logit(pi-hat) = -2.1325 + 3.219 = 1.0865 for x2 = 10
#     pi-hat = exp(1.0865) / [1 + exp(1.0865)] = 2.96388231 / 3.96388231 = 0.7477
#     The probability of being hired with 10 years of experience is 0.7477.

# g.  H0:  beta_1 = 0
#     Ha:  beta_1 does not equal 0
#     Test Statistic:  Z0 = 2.188
#     p-value:  0.02864
#     Conclusion:  Since 0.01 < p-value = 0.02864, there is marginal evidence
#     that years of experience has a significant effect.

# h.  The estimated odds of being hired increase by 1.3797 times for every 1-year
#     increase in years of experience.
#     exp(0.3219) = 1.3797

# i.  The years of higher education, x1, is not significant.  Thus the most
#     parsimonious model is:  logit(pi) = beta_0 + beta_1x2.


#Final Assessment 3
temp <- c(66, 70, 69, 68, 67, 72, 73, 70, 57, 63, 70, 78, 67, 53, 67, 75,
          70, 81, 76, 79, 75, 76, 58)
pressure <- c(50, 50, 50, 50, 50, 50, 100, 100, 200, 200, 200, 200, 200,
              200, 200, 200, 200, 200, 200, 200, 200, 200, 200)
o.ring <- c(0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0,
            2, 0, 1)
number <- c(6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
            6, 6)
challenger <- data.frame(temp, pressure, o.ring, number)
challenger

mod.fit <- glm(formula = o.ring/number ~ temp + pressure, family =
                 binomial(link = logit), data = challenger, weights = number)
summary(mod.fit)

# a.  logit(pi-hat) = 2.5202 - 0.0983temp + 0.0085pressure

# b. Temp
#    H0:  beta_1 = 0
#    Ha:  beta_1 not equal to 0
#    Z0 = -2.190
#    p-value = 0.0285
#    Conclusion:  Since 0.01 < p-value = 0.0285 < 0.05, there is marginal
#    evidence to indicate temperature has an effect on the probability of an
#    O-ring failure.

#    Pressure
#    H0:  beta_2 = 0
#    Ha:  beta_2 not equal to 0
#    Z0 = 1.105
#    p-value = 0.2691
#    Conclusion:  Since p-value = 0.2691 > alpha = 0.05, there is insufficient
#    evidence to indicate pressure has an effect on the probability of an
#    O-ring failure.

mod.fit2 <- glm(formula = o.ring/number ~ temp, family =
                  binomial(link = logit), data = challenger, weights = number)
summary(mod.fit2)

# c.  The estimated logistic regression model is logit(pi-hat) = 5.08498 - 
#     0.11560temp.

# d.  H0:  beta_1 = 0
#     Ha:  beta_1 not equal to 0
#     Test Statistic:  Z0 = -2.458
#     p-value:  0.0140
#     Conclusion:  Since 0.01 < p-value = 0.0140 < 0.05, there is marginal
#     evidence that temperature has a significant effect.

# e.  The odds of O-ring failure decrease by 0.8908 times for every 1-degree
#     increase in temeperature.
#     exp(-0.1156) = 0.8908

# f.  The odds of O-ring failure increase by 3.1772 times for every 10-degree
#     decrease in temperature.
#     exp[(-10)(-0.1156)] = exp(1.156) = 3.1772

# g.  In the two-variable model, pressure is not significant.  In the model with
#     temperature as the single explanatory variable, temperature is significant.
#     Hence the most parsimonious model is:  logit(pi) = beta_0 + beta_1*temp.