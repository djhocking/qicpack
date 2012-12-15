setwd('/Users/Dan/Documents/Rpackages/QICpack/')

library(geepack)
data(dietox)
source('qic.R')
source('qictab.R')

package.skeleton('QICpack')

setwd('/Users/Dan/Documents/Rpackages/git/qicpack/')
source('QICpack_0.9.tar.gz')