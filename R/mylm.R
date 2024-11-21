#' Linear Regression Model
#'
#' This function fits a simple linear regression model using the normal equations.
#'
#' @param formula A formula specifying the regression model, e.g., `y ~ x`.
#' @param data A data frame containing the data for the model.
#' @return A list with two elements:
#' \item{coefficients}{A vector of estimated regression coefficients.}
#' \item{fitted.values}{A vector of fitted values from the model.}
#' @examples
#' # Example usage:
#' set.seed(123)
#' data <- data.frame(
#'   x = rnorm(1000),
#'   y = 3 * rnorm(1000) + 5
#' )
#' model <- help(SLM(y ~ x, data)
#' print(model$coefficients)
#' print(model$fitted.values)
#' @export
SLM <- function(formula, data) {

#Construct the design matrix X and the response variables y.
  y <- model.response(model.frame(formula, data))
  X <- model.matrix(formula, data)

#Matrix transposition and multiplication using C++ via Rcpp.
  Xt <- cpp_matrix_transpose(X)
  XtX <- cpp_matrix_multiply(Xt, X)
  Xty <- cpp_matrix_multiply(Xt, as.matrix(y))

#Estimated coefficient beta = ((X^t)X)^-1(X^t)y
  beta <- solve(XtX, Xty)

#Calculate the fitted value.
  fitted_values <- X %*% beta

#Return the result, a list combining the coefficients of the model and the fitted value.
  return(list(coefficients = beta, fitted.values = fitted_values))
}
