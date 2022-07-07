library(tidyverse)

dblLinear <- function(n) {
  u <- 1
  i <- 1
  j <- 1
  while (length(u) < n + 1) {
    y <- 2 * u[i] + 1
    z <- 3 * u[j] + 1
    if (y < z) {
      u[length(u) + 1] <- y
      i <- i + 1
    } else if (y > z) {
      u[length(u) + 1] <- z
      j <- j + 1
    } else {
      u[length(u) + 1] <- y
      i <- i + 1
      j <- j + 1
    }
  }
  u[n + 1]
}


library(testthat)
testing <- function(n, expected) {
  actual <- dblLinear(n)
  expect_equal(actual, expected)
}
test_that("tests", {
  testing(10, 22)
  testing(20, 57)
  testing(50, 175)
})
