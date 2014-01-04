qicpack
=======

qicpack R package

Calculates QIC (Pan 2001) for Generalized Estimating Equations. This is my first attempt at an R package and it has had very limited testing. I put it on GitHub as is, so use with caution. Also, if you find problems or want to see features let me know or submit a pull request.

## Functions

qic()
Takes output from geepack and calculates QIC

qictab()
Takes a list of geepack models and produces a table of QIC values the way aictab produces an AIC table
