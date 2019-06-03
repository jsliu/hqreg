#' predict model by choosing the cross validated hqreg model
#' @param object cross validated hqreg models
#' @param x new data
#' @export
predict.cv.hqreg <- function(object, X, lambda = c("lambda.1se","lambda.min"), type = c("response","coefficients","nvars"), ...) {
  type = match.arg(type)
  if (is.character(lambda)) {
    lambda = match.arg(lambda)
    lambda = object[[lambda]]
  } else if(!is.numeric(lambda)) stop("Invalid lambda")
  predict(object$fit, X, lambda = lambda, type = type, ...)
}

#' coefficient of cross validated models
#' @param object cross validated hqreg model
#' @param lambda choose "lambda.1se" or "lambda.min"
#' @export
coef.cv.hqreg <- function(object, lambda = c("lambda.1se","lambda.min"), ...) {
  if (is.character(lambda)) {
    lambda = match.arg(lambda)
    lambda = object[[lambda]]
  } else if(!is.numeric(lambda)) stop("Invalid lambda")
  coef(object$fit, lambda = lambda, ...)
}
