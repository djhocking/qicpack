qic <-
function(model.R) {
    require(MASS, quietly = TRUE)
    
    check.class <- class(model.R)
    known <- NULL
    if(identical(check.class[1], "geeglm")) {
      known[1] <- 1
    } 
    
    if(identical(check.class[1], "geese")) {
      stop("\nQIC function not defined for object of class geese rerun models using geeglm in geepack\n")
      known[2] <- 1
    }
    
    if(sum(known) < 1) {
      stop("\nFunction not defined for this object class\n")
    }
    
    model.indep <- update(model.R, corstr = "independence")
    
    # Quasilikelihood
    mu.R <- model.R$fitted.values
    y <- model.R$y
    type <- family(model.R)$family
    quasi.R <- switch(type,
                      poisson = sum((y*log(mu.R)) - mu.R),
                      gaussian = sum(((y - mu.R)^2)/-2),
                      binomial = sum(y*log(mu.R/(1 - mu.R)) + log(1 - mu.R)),
                      Gamma = sum(-y/mu.R - log(mu.R)),
                      stop("Error: distribution not defined for this function"))
    
    # Trace Term (penalty for model complexity)
    omegaI <- ginv(model.indep$geese$vbeta.naiv) # Omega-hat(I) via Moore-Penrose 
    Vr <- model.R$geese$vbeta
    trace.R <- sum(diag(omegaI %*% Vr))
    px <- dim(model.matrix(model.indep))[2]
    
    # QIC
    QIC <- 2*(trace.R - quasi.R)
    QICu <- (-2)*quasi.R + 2*px    # Approximation assuming model structured correctly
    output <- data.frame(list(QIC, QICu, quasi.R, trace.R, px))
    names(output) <- c('QIC', 'QICu', 'Log.QLik', 'Trace', 'px')
    return(output)
  }
