# Activity 1 Code
par(mfrow = c(1,2))
beta0 <- 1
beta1 <- 0.8
curve(expr = exp(beta0 + beta1*x) / (1 + exp(beta0 + beta1*x)), xlim =
        c(-15,15), col = "black", main = expression(pi ==
                                                      frac(e^{1+0.8*x[1]},
                                                           1+e^{1+0.8*x[1]})),
      xlab = expression(x[1]), ylab = expression(pi))
beta1 <- -0.8
curve(expr = exp(beta0 + beta1*x) / (1 + exp(beta0 + beta1*x)), xlim =
        c(-15,15), col = "black", main = expression(pi ==
                                                      frac(e^{1-0.8*x[1]},
                                                           1+e^{1-0.8*x[1]})),
      xlab = expression(x[1]), ylab = expression(pi))


# Activity 2 Code
age <- c(12, 15, 42, 52, 59, 73, 82, 91, 96, 105, 114, 120, 121, 128, 130,
         139, 139, 157, 1, 1, 2, 8, 11, 18, 22, 31, 37, 61, 72, 81, 97, 112, 118, 127,
         131, 140, 151, 159, 177, 206) #In Months
kyphosis <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0,
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
#1 present, 0 absent
tableactivity2 <- data.frame(age, kyphosis)
tableactivity2
#Logistic model
mod.fit <- glm(formula = kyphosis ~ age, data = tableactivity2, family =
                 binomial(link = logit))
mod.fit
linear.pred <- mod.fit$coefficients[1] + mod.fit$coefficients[2]*150
as.numeric(exp(linear.pred) / (1+exp(linear.pred)))
curve(expr = exp(mod.fit$coefficients[1] +
                   mod.fit$coefficients[2]*x) / (1 +
                                                   exp(mod.fit$coefficients[1] +
                                                         mod.fit$coefficients[2]*x)),
      col = "red", xlim = c(0, 220),
      ylab = expression(hat(pi)), xlab = "Age (Months",
      main = "Estimated probability of kyphosis",
      panel.first = grid() )


# Activity 3 Code
y <- c(0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0,
       1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1) # 1 = hired, 0 = not hired
x1 <- c(6, 4, 6, 6, 4, 8, 4, 4, 6, 8, 4, 8, 4, 6,
        4, 6, 8, 6, 4, 4, 4, 6, 8, 4, 8, 6, 4, 6) # Education, years
x2 <- c(2, 0, 6, 3, 1, 3, 2, 4, 1, 10, 2, 5, 2, 7,
        5, 4, 0, 1, 7, 1, 5, 0, 5, 9, 1, 1, 10, 12) # Experience, years
x3 <- c(0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,
        1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0) # 1 = male, 0 = female
tableactivity3 <- data.frame(y, x1, x2, x3)
tableactivity3
#Logistic model
mod.fit2 <- glm(formula = y ~ x1 + x2 + x3, data = tableactivity3, family =
                  binomial(link = logit))
mod.fit2
linear.pred <- mod.fit2$coefficients[1] + mod.fit2$coefficients[2]*4 +
  mod.fit2$coefficients[3]*0 + mod.fit2$coefficients[4]*1
as.numeric(exp(linear.pred) / (1+exp(linear.pred)))


# Activity 4 Code
vcov(mod.fit)
round(summary(mod.fit)$coefficients, 4)


# Activity 5 Code
vcov(mod.fit2)
round(summary(mod.fit2)$coefficients, 4)


# Activity 6 Code
summary(mod.fit)


# Activity 7 Code
summary(mod.fit2)


# Activity 8 Code
library(package = car)
Anova(mod = mod.fit, test = "LR")


# Activity 9 Code
library(package = car)
Anova(mod = mod.fit2, test = "LR")


# Activity 10 Code
exp(mod.fit$coefficients[2])
exp(12*mod.fit$coefficients[2])


# Activity 11 Code
beta.ci <- confint.default(object = mod.fit, parm = "age",
                           level = 0.95)
beta.ci
beta.ci <- confint(object = mod.fit, parm = "age", level = 0.95)
beta.ci
beta.ci <- confint.default(object = mod.fit, parm = "age",
                           level = 0.95)
beta.ci
exp(beta.ci*12)
beta.ci <- confint(object = mod.fit, parm = "age", level = 0.95)
beta.ci
exp(beta.ci*12)


# Activity 12 Code
predict.data <- data.frame(age = 180)
predict(object = mod.fit, newdata = predict.data, type = "link")
predict(object = mod.fit, newdata = predict.data, type = "response")


# Activity 13 Code
linear.pred <- mod.fit2$coefficients[1] + mod.fit2$coefficients[2]*4 +
  mod.fit2$coefficients[3]*3 + mod.fit2$coefficients[4]*0
as.numeric(exp(linear.pred) / (1+exp(linear.pred)))


# Activity 14 Code
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


# Activity 15 Code
predict.data <- data.frame(x1 = c(4,4), x2 = c(3,0), x3 = c(0,1))
predict.data
alpha <- 0.05
linear.pred <- predict(object = mod.fit2, newdata =
                         predict.data, type = "link", se = TRUE)
CI.lin.pred.1 <- linear.pred$fit[1] + qnorm(p =
                                              c(alpha/2, 1 - alpha/2)) *
  linear.pred$se[1]
CI.lin.pred.2 <- linear.pred$fit[2] + qnorm(p =
                                              c(alpha/2, 1 - alpha/2)) *
  linear.pred$se[2]
round(exp(CI.lin.pred.1) / (1+exp(CI.lin.pred.1)), 4) #CI for x1=4, x2=3, x3=0
round(exp(CI.lin.pred.2) / (1+exp(CI.lin.pred.2)), 4) #CI for x1=4, x2=0, x3=1


# Activity 16 Code
library(package = mcprofile)
K <- matrix(data = c(1,180), nrow = 1, ncol = 2)
K
# Calculate -2log(Lambda)
linear.combo <- mcprofile(object = mod.fit, CM = K)
# CI for beta_0 + beta_1 * x
ci.logit.profile <- confint(object = linear.combo, level = 0.95)
ci.logit.profile
names(ci.logit.profile)
exp(ci.logit.profile$confint) / (1 +
                                   exp(ci.logit.profile$confint))