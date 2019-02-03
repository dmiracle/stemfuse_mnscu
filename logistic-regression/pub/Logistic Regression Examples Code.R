# Figures 1 and 2 Code
par(mfrow = c(1,2))
beta0 <- 1
beta1 <- 0.5
curve(expr = exp(beta0+beta1*x) / (1+exp(beta0+beta1*x)), xlim = 
        c(-15, 15), col = "black", main = expression(pi ==
                                                       frac(e^{1+0.5*x[1]},
                                                            1+e^{1+0.5*x[1]})),
      xlab = expression(x[1]), ylab = expression(pi))
beta1 <- -0.5
curve(expr = exp(beta0+beta1*x) / (1+exp(beta0+beta1*x)), xlim =
        c(-15, 15), col = "black", main = expression(pi ==
                                                       frac(e^{1-0.5*x[1]},
                                                            1+e^{1-0.5*x[1]})),
      xlab = expression(x[1]), ylab = expression(pi))


# Figure 3 Code
temp <- c(66, 70, 69, 68, 67, 72, 73, 70, 57, 63, 70, 78,
          67, 53, 67, 75, 70, 81, 76, 79, 75, 76, 58) #In Fahrenheit
TD <- c(0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0,
        1, 0, 1) #1 distress, 0 no distress
tableexample1 <- data.frame(temp, TD)
tableexample1


# Figure 4 Code
#Logistic model
mod.fit <- glm(formula = TD ~ temp, data = tableexample1, family = binomial
               (link = logit))
mod.fit


# Figure 5 Code
names(mod.fit)


# Figure 6 Code
mod.fit$coefficients


# Figure 7 Code
summary(object = mod.fit)


# Figure 8 Code
linear.pred <- mod.fit$coefficients[1] + mod.fit$coefficients[2]*56
linear.pred
exp(linear.pred)/(1+exp(linear.pred))
as.numeric(exp(linear.pred)/(1+exp(linear.pred))) #Removes label


# Figure 9 Code
linear.pred <- mod.fit$coefficients[1] + mod.fit$coefficients[2]*31
as.numeric(exp(linear.pred)/(1+exp(linear.pred)))


# Figures 10 and 11 Code
curve(expr = exp(mod.fit$coefficients[1] +
                   mod.fit$coefficients[2]*x) / (1 +
                                                   exp(mod.fit$coefficients[1] +
                                                         mod.fit$coefficients[2]*x)),
      col = "red", xlim = c(30,90),
      ylab = expression(hat(pi)), xlab = "Temperature",
      main = "Estimated probability of thermal distress",
      panel.first = grid() )


# Figure 12 Code
D <- c(45, 15, 40, 83, 90, 25, 35, 65, 95, 35, 75, 45,
       50, 75, 30, 25, 20, 60, 70, 30, 60, 61, 65, 15,
       20, 45, 15, 25, 15, 30, 40, 15, 135, 20, 40)
T <- c(0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1,
       1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1,
       1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1)
Y <- c(0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
       0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0,
       0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0)
tableexample2 <- data.frame(D, T, Y)


# Figure 13 Code
tableexample2


# Figure 14 Code
mod.fit2 <- glm(formula = Y ~ D + T, family =
                  binomial(link = logit), data = tableexample2)
summary(mod.fit2)


# Figure 15 Code
round(summary(mod.fit)$coefficients, 4)


# Figure 16 Code
vcov(mod.fit)


# Figure 17 Code
vcov(mod.fit)[2,2] # var-hat(beta-hat_1)


# Figure 18 Code
library(package = car)
Anova(mod = mod.fit, test = "LR")


# Figure 19 Code
Anova(mod.fit2, test = "LR")


# Figure 20 Code
anova(mod.fit2, test = "Chisq")


# Figure 21 Code
mod.fit.Ho <- glm(formula = Y ~ T, family =
                    binomial(link = logit), data = tableexample2)
anova(mod.fit.Ho, mod.fit2, test = "Chisq")


# Figure 22 Code
exp(mod.fit$coefficients[2])
exp(-10*mod.fit$coefficients[2])


# Figure 23 Code
beta.ci <- confint(object = mod.fit, parm = "temp", level =
                     0.95)
beta.ci
rev(exp(-10*beta.ci)) # OR C.I. for c = -10
# Remove labels with as.numeric()
as.numeric(rev(exp(-10*beta.ci)))


# Figure 24 Code
beta.ci <- confint.default(object = mod.fit, parm = "temp",
                           level = 0.95)
beta.ci
rev(exp(-10*beta.ci)) # OR C.I. for c = -10


# Figure 25 Code
beta.ci <- mod.fit$coefficients[2] + qnorm(p = c(0.025, 0.975)) *
  sqrt(vcov(mod.fit)[2,2])
beta.ci
rev(exp(-10*beta.ci)) # OR C.I. for c = -10


# Figure 26 Code
linear.pred <- mod.fit$coefficients[1] +
  mod.fit$coefficients[2] * 50
linear.pred
as.numeric(exp(linear.pred) / (1 + exp(linear.pred)))


# Figure 27 Code
predict.data <- data.frame(temp = 50)
predict(object = mod.fit, newdata = predict.data, type = "link")
predict(object = mod.fit, newdata = predict.data, type = "response")


# Figure 28 Code
alpha <- 0.05
linear.pred <- predict(object = mod.fit, newdata = predict.data, type = "link",
                       se = TRUE)
linear.pred
pi.hat <- exp(linear.pred$fit) / (1 + exp(linear.pred$fit))
CI.lin.pred <- linear.pred$fit + qnorm(p = c(alpha/2,
                                             1 - alpha/2)) * linear.pred$se
CI.pi <- exp(CI.lin.pred) / (1 + exp(CI.lin.pred))
round(data.frame(predict.data, pi.hat, lower = CI.pi[1], upper = 
                   CI.pi[2]), 4)


# Figure 29 Code
predict.data <- data.frame(D = c(60, 90), T = c(0, 1))
predict.data
alpha <- 0.05
linear.pred <- predict(object = mod.fit2, newdata =
                         predict.data, type = "link", se = TRUE)
CI.lin.pred.D60 <- linear.pred$fit[1] + qnorm(p =
                                                c(alpha/2, 1-alpha/2)) *
  linear.pred$se[1]
CI.lin.pred.D90 <- linear.pred$fit[2] + qnorm(p =
                                                c(alpha/2, 1-alpha/2)) *
  linear.pred$se[2]
round(exp(CI.lin.pred.D60) / (1+exp(CI.lin.pred.D60)), 4) #CI for D = 60
round(exp(CI.lin.pred.D90) / (1+exp(CI.lin.pred.D90)), 4) #CI for D = 90


# Figure 30 Code
library(package = mcprofile)
K <- matrix(data = c(1, 50), nrow = 1, ncol = 2)
K
# Calculate -2log(Lambda)
linear.combo <- mcprofile(object = mod.fit, CM = K)
# CI for beta_0 + beta_1 * x
ci.logit.profile <- confint(object = linear.combo, level = 0.95)
ci.logit.profile
names(ci.logit.profile)
exp(ci.logit.profile$confint) / (1 +
                                   exp(ci.logit.profile$confint))