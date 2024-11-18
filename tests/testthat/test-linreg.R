
test_that("my_lm works for simple linear regression", {
  set.seed(123)
  data <- data.frame(
    x = rnorm(1000),
    y = 3 * rnorm(1000) + 5
  )

  model <- my_lm(y ~ x, data)

  expect_true(length(model$coefficients) == 2)
  expect_true(is.numeric(model$fitted.values))
  expect_equal(length(model$fitted.values), nrow(data))
})
