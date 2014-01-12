qictab <-
function(cand.set, modnames, sort = TRUE) {
  check.y <- lapply(X = cand.set, FUN = function(b) b$y)
  if(length(unique(check.y)) > 1)
    stop("\nThe same response variable must be used for all models\n")
  Results <- NULL
  Results <- data.frame(Model = modnames)
  qicout <- matrix(unlist(lapply(X = cand.set, FUN = qic)), length(cand.set), 5, byrow = TRUE)
  Results$QIC <- qicout[ , 1]
  Results$QICu <- qicout[ , 2]
  Results$LQLik <- qicout[ , 3]
  Results$Trace <- qicout[ , 4]
  Results$px <- qicout[ , 5]
  Results$dQIC <- Results$QIC - min(Results$QIC)
  Results$RelQLik <- exp(-0.5 * Results$dQIC)
  Results$QICwt <- Results$RelQLik/sum(Results$RelQLik)
  if(length(unique(Results$QIC)) != length(cand.set))
    warning("\nCheck model structure carefully as some models may be redundant\n")
  if(sort){
    Results <- Results[order(Results[, "dQIC"]), ]
    Results$Cum.Wt <- cumsum(Results[, "QICwt"])
  }
  else{
    Results$Cum.Wt <- NULL
  }
  class(Results) <- c("qictab", "data.frame")
  return(Results)
}