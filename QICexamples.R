setwd('/Users/Dan/Documents/Rpackages/git/qicpack/')
install.packages('QICpack_0.9.tar.gz', type = 'source')
library(QICpack)

data(dietox)
dietox$Cu = as.factor(dietox$Cu)
mf = formula(Weight ~ Cu * (Time + I(Time^2) + I(Time^3)))
gee1 = geeglm(mf, data = dietox, id = Pig, family = gaussian, corstr = "ar1")
gee1
summary(gee1)

mf2 = formula(Weight ~ Cu * Time + I(Time^2) + I(Time^3))
gee2 = geeglm(mf2, data = dietox, id = Pig, family = gaussian, corstr = "ar1")
summary(gee2)
anova(gee2)
anova(gee1, gee2)

mf3 = formula(Weight ~ Cu + Time + I(Time^2))
gee3 = geeglm(mf3, data = dietox, id = Pig, family = gaussian, corstr = "ar1")
gee3.I = update(gee3, corstr = "independence")
gee3.Ex = update(gee3, corstr = "exchangeable")

model.set <- list(gee1, gee2, gee3, gee3.I, gee3.Ex)
mod.names <- c("gee1", "gee2", "gee3", "gee3.I", "gee3.Ex")
qictab(model.set, mod.names)

## a function to generate a dataset
set.seed(12345)

gendat <- function() {
  id <- gl(50, 4, 200)
  visit <- rep(1:4, 50)
  x1 <- rbinom(200, 1, 0.6) ## within cluster varying binary covariate
  x2 <- runif(200, 0, 1)   ## within cluster varying continuous covariate
  phi <- 1 + 2 * x1         ## true scale model
  ## the true correlation coefficient rho for an ar(1)
  ## correlation structure is 0.667.
  rhomat <- 0.667 ^ outer(1:4, 1:4, function(x, y) abs(x - y))
  chol.u <- chol(rhomat)
  noise <- as.vector(sapply(1:50, function(x) chol.u %*% rnorm(4)))
  e <- sqrt(phi) * noise
  y <- 1 + 3 * x1 - 2 * x2 + e
  dat <- data.frame(y, id, visit, x1, x2)
  dat
}

dat <- gendat()
fit1 <- geeglm(y ~ x1, id = id, data = dat, corstr = "ar1") #,sformula = ~ x1)
summary(fit)

# Add random variable with no relation to y
dat$x3 <- rnorm(200, 0, 1)
dat$x4 <- rnorm(200, 0, 1)
dat$x5 <- rnorm(200, 0, 10)
dat$x6 <- rnorm(200, 10, 1)
fit2 <- geeglm(y ~ x1 + x2, id = id, data = dat, corstr = "ar1") # should be best model
fit3 <- geeglm(y ~ x1 + x2 + x3, id = id, data = dat, corstr = "ar1")
fit4 <- geeglm(y ~ x1 + x2 + x3 + x4, id = id, data = dat, corstr = "ar1")
fit5 <- geeglm(y ~ x1 + x2 + x5, id = id, data = dat, corstr = "ar1")
fit6 <- geeglm(y ~ x1 + x2 + x6, id = id, data = dat, corstr = "ar1")

model.list <- list(fit1, fit2, fit3, fit4, fit5, fit6)
qictab(model.list, c(1,2,3,4,5,6))

library(lme4)
glmm1 <- lmer(y ~ x1 + (1|id), data = dat, REML = FALSE)
glmm2 <- lmer(y ~ x1 + x2 + (1|id), data = dat, REML = FALSE)
glmm3 <- lmer(y ~ x1 + x2 + x3 + (1|id), data = dat, REML = FALSE)
glmm4 <- lmer(y ~ x1 + x2 + x3 + x4 + (1|id), data = dat, REML = FALSE)
glmm5 <- lmer(y ~ x1 + x2 + x5 + (1|id), data = dat, REML = FALSE)
glmm6 <- lmer(y ~ x1 + x2 + x6 + (1|id), data = dat, REML = FALSE)

library(AICcmodavg)
aic.list <- list(glmm1, glmm2, glmm3, glmm4, glmm5, glmm6)
aictab(aic.list, c(1,2,3,4,5,6))

plot(dat$x3, dat$y)
plot(dat$x1, dat$y)
plot(dat$x2, dat$y)