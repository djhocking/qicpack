\name{qic}
\alias{qic}

\title{
Calculates QIC (Pan 2001) for model generated using geeglm in geepack
}
\description{
This function calculates the quasilikelihood information criteria (QIC; Pan 2001) for model generated using geeglm in geepack. The QIC is intended as an equivalent of AIC for generalized estimating equations (GEE-PA).
}
\usage{
qic(model.R)
}

\arguments{
  \item{model.R}{
model.R is the fitted gee model from geeglm within geepack
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
Returns QIC, log quasilikelihood, trace (eqivalent to K in AIC), px in a data frame
}
\references{
Hardin, J. W. and J. M. Hilbe. 2003. Generalized estimating equations. Chapman and Hall, New York.

Pan, W. 2001. Akaike's information criterion in generalized estimating equations. Biometrics 57:120-125.
}
\author{
Daniel J. Hocking
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
data(dietox)
dietox$Cu <- as.factor(dietox$Cu)
mf <- formula(Weight ~ Cu * (Time + I(Time^2) + I(Time^3)))
gee1 <- geeglm(mf, data = dietox, id = Pig, family = gaussian, corstr = "ar1")
gee1
summary(gee1)
qic(gee1)
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
