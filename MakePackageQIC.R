setwd('/Users/Dan/Documents/Rpackages/qicpack/QICpack/R/')

library(geepack)
data(dietox)
source('qic.R')
source('qictab.R')

package.skeleton('QICpack')


setwd('/Users/Dan/Documents/Rpackages/qicpack/')
library(devtools)
build('QICpack')
check('QICpack')
check('QICpack_0.9.1.tar.gz')

setwd('/Users/Dan/Documents/Rpackages/qicpack/')
install.packages('QICpack_0.9.1.tar.gz', type = 'source')
library(QICpack)