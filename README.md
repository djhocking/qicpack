qicpack
=======

qicpack R package

Calculates QIC (Pan 2001) for Generalized Estimating Equations. This is my first attempt at an R package and it has had very limited testing. I put it on GitHub as is, so use with caution. Also, if you find problems or want to see features let me know or submit a pull request.

## Functions

qic()
Takes output from geepack and calculates QIC

qictab()
Takes a list of geepack models and produces a table of QIC values the way aictab produces an AIC table

## Installation

The easiest way to install this package is using `devtools`:

```library(devtools)
```

```
install_github(repo = "djhocking/qicpack/QICpack")
```

Let me know if you use this method and have problems. I most recently tested installation with R version 3.3.0 on a Mac (OS X 10.11.6) in RStudio.
