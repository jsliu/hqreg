#' measure the function loss
#' @param r residual
#' @param weights weights of observations
#' @param args arguments of type measure
#' @export
#' @return value of loss function
measure.hqreg <- function(r, weights=rep(1,length(r)), args) 
{
  type.measure <- args$type.measure
  if (type.measure == "deviance") {
    method <- args$method
    if (method == "huber") {
      val <- hloss(r, args$gamma)
    } else if (method == "quantile") {
      val <- qloss(r, args$tau)*weights
    } else {
      val <- (r*weights)^2
    }    
  } else if (type.measure == "mse") {
    val <- (r*weights)^2
  } else {
    val <- abs(r*weights)
  }
  return(val)
}

#' huber loss function
#' @param r residual
#' @export
hloss <- function(r, gamma) {
  rr <- abs(r)
  ifelse(rr <= gamma, rr^2/(2*gamma), rr-gamma/2)
}

#' quantile loss function
#' @param r residual
#' @export
qloss <- function(r, tau) ifelse(r <= 0, (tau-1)*r, tau*r)
