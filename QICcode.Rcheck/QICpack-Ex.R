pkgname <- "QICpack"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('QICpack')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("qic")
### * qic

flush(stderr()); flush(stdout())

### Name: qic
### Title: Calculates QIC (Pan 2001) for model generated using geeglm in
###   geepack
### Aliases: qic
### Keywords: ~QIC ~GEE

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.




cleanEx()
nameEx("qictab")
### * qictab

flush(stderr()); flush(stdout())

### Name: qictab
### Title: Calculates QIC (Pan 2001) for a list of fitted objects from
###   geeglm within geepack and outputs a table relative model fits
### Aliases: qictab
### Keywords: ~GEE ~QIC

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.





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
