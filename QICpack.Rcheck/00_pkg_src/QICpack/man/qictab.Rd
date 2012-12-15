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

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }