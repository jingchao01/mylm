
# mylm

<!-- badges: start -->
[![R-CMD-check](https://github.com/jingchao01/mylm/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jingchao01/mylm/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/jingchao01/mylm/graph/badge.svg)](https://app.codecov.io/gh/jingchao01/mylm)
<!-- badges: end -->

The goal of mylm package is to provide a simple implementation of simple linear regression models. The function in this package is "my_lm.
    It supports efficient computation using matrix algebra and includes integration 
    with C++ for improved performance via the Rcpp package.
    This package is ideal for lightweight alternative to base R's `lm` function.

## Installation

You can install the development version of mylm like so:

``` r
# install.packages("devtools")
devtools::install_github("jingchao01/mylm")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r

library(mylm)
set.seed(123)
data <- data.frame(
  x = rnorm(1000),
  y = 3 * rnorm(1000) + 5
)

model <- SLM(y ~ x, data)

model$coefficients
model$fitted.values

```

