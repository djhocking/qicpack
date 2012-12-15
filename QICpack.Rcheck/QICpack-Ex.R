pkgname <- "QICpack"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('QICpack')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("dietox")
### * dietox

flush(stderr()); flush(stdout())

### Name: dietox
### Title: dietox dataset from geepack
### Aliases: dietox
### Keywords: datasets

### ** Examples

data(dietox)
## maybe str(dietox) ; plot(dietox) ...



cleanEx()
nameEx("qic")
### * qic

flush(stderr()); flush(stdout())

### Name: qic
### Title: Calculates QIC (Pan 2001) for model generated using geeglm in
###   geepack
### Aliases: qic
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(dietox)
dietox$Cu <- as.factor(dietox$Cu)
mf <- formula(Weight ~ Cu * (Time + I(Time^2) + I(Time^3)))
gee1 <- geeglm(mf, data = dietox, id = Pig, family = gaussian, corstr = "ar1")
gee1
summary(gee1)
qic(gee1)



cleanEx()
nameEx("qictab")
### * qictab

flush(stderr()); flush(stdout())

### Name: qictab
### Title: Calculates QIC (Pan 2001) for a list of fitted objects from
###   geeglm within geepack and outputs a table relative model fits
### Aliases: qictab

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
library(geepack)

data(dietox)
dietox$Cu = as.factor(dietox$Cu)
mf = formula(Weight ~ Cu * (Time + I(Time^2) + I(Time^3)))
gee1 = geeglm(mf, data = dietox, id = Pig, family = gaussian, corstr = "ar1")

mf2 = formula(Weight ~ Cu * Time + I(Time^2) + I(Time^3))
gee2 = geeglm(mf2, data = dietox, id = Pig, family = gaussian, corstr = "ar1")

mf3 = formula(Weight ~ Cu + Time + I(Time^2))
gee3 = geeglm(mf3, data = dietox, id = Pig, family = gaussian, corstr = "ar1")
gee3.I = update(gee3, corstr = "independence")
gee3.Ex = update(gee3, corstr = "exchangeable")

model.set <- list(gee1, gee2, gee3, gee3.I, gee3.Ex)
mod.names <- c("gee1", "gee2", "gee3", "gee3.I", "gee3.Ex")
qictab(model.set, mod.names)

{ ~kwd1 }
{ ~kwd2 }



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
