#' weighted standardise the data
#' @param x observations
#' @param weights weights of observations
#' @import Hmisc
#' @export
weighted.standardise <- function(x, weights)
{
  xm <- wtd.mean(x,weights)
  xsd <- sqrt(wtd.var(x,weights))
  return((x-xm)/xsd)
}