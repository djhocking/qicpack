\name{qictab}
\alias{qictab}

\title{
Calculates QIC (Pan 2001) for a list of fitted objects from geeglm within geepack and outputs a table relative model fits
}
\description{
Calculates QIC, delta QIC, QIC weights similiar to the aictab function within the AICcmodavg package. The function outputs a table of of the relative fit of each model in desending order.
}
\usage{
qictab(cand.set, modnames, sort = TRUE)
}

\arguments{
  \item{cand.set}{
A list of models (candidate set) fit using geeglm from geepack
}
  \item{modnames}{
Names of the models in the candidate set list
}
  \item{sort}{
If TRUE sorts the output table in desending order from best model to least supported
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Function returns a data table of model name, QIC, Log Quaislikelihood, Trace, px, delta QIC, QIC model weights, and cummulative model weight
}
\references{
Pan, W. 2001. Akaike's information criterion in generalized estimating equations. Biometrics 57:120-125.

Burnham, K. P. and D. R. Anderson. 2002. Model selection and multimodel inference: a practical information-theoretic approach. Second edition. Springer Science and Business Media, Inc., New York.

}
\author{
Daniel J. Hocking <dhocking@unh.edu>
}
\note{
%%  ~~further notes~~
}


\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
library(geepack)

data(dietox)
dietox$Cu = as.factor(dietox$Cu)
mf = formula(Weight ~ Cu * (Time + I(Time^2) + I(Time^3)))
gee1 = geeglm(mf, data = dietox, id = Pig, family = poisson, corstr = "ar1")

mf2 = formula(Weight ~ Cu * Time + I(Time^2) + I(Time^3))
gee2 = geeglm(mf2, data = dietox, id = Pig, family = poisson, corstr = "ar1")

mf3 = formula(Weight ~ Cu + Time + I(Time^2))
gee3 = geeglm(mf3, data = dietox, id = Pig, family = poisson, corstr = "ar1")
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
fit2 <- geeglm(y ~ x1 + x2, id = id, data = dat, corstr = "ar1")
fit3 <- geeglm(y ~ x1 + x2 + x3, id = id, data = dat, corstr = "ar1")
fit4 <- geeglm(y ~ x1 + x2 + x3 + x4, id = id, data = dat, corstr = "ar1")
fit5 <- geeglm(y ~ x1 + x2 + x5, id = id, data = dat, corstr = "ar1")
fit6 <- geeglm(y ~ x1 + x2 + x6, id = id, data = dat, corstr = "ar1")

model.list <- list(fit1, fit2, fit3, fit4, fit5, fit6)
qictab(model.list, c(1,2,3,4,5,6))
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
