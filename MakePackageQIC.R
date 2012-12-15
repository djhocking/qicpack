setwd('/Users/Dan/Documents/Rpackages/git/qicpack/')

library(geepack)
data(dietox)
source('qic.R')
source('qictab.R')

package.skeleton('QICpack')


library(devtools)
build('QICpack')
check('QICpack')
check('QICpack_0.9.tar.gz')

setwd('/Users/Dan/Documents/Rpackages/git/qicpack/')
install.packages('QICpack_0.9.tar.gz', type = 'source')
library(QICpack)