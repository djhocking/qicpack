\name{dietox}
\alias{dietox}
\docType{data}
\title{
Toxicity data from geepack
}
\description{
Heavy metal toxicity data from geepack
}
\usage{data(dietox)}
\format{
  A data frame with 861 observations on the following 7 variables.
  \describe{
    \item{\code{Weight}}{a numeric vector}
    \item{\code{Feed}}{a numeric vector}
    \item{\code{Time}}{a numeric vector}
    \item{\code{Pig}}{a numeric vector}
    \item{\code{Evit}}{a numeric vector}
    \item{\code{Cu}}{a numeric vector}
    \item{\code{Litter}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
Hojsgaard, S., U. Halekoh, and J. Yan. 2006. The R package geepack for generalized estimating equations. Journal of Statistical Software 15:1-11.
}
\examples{
data(dietox)
## maybe str(dietox) ; plot(dietox) ...
}
\keyword{datasets}
