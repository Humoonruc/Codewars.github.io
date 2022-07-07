library(tidyverse)
library(data.table)
library(magrittr)


doubles <- function(maxk, maxn) {
  iterator <- expand.grid(k = 1:maxk, n = 1:maxn) %>% as.data.table()
  iterator[, v := 1 / (k * (n + 1)^(2 * k))][, v] %>% sum()
}

doubles(1, 10)



library(testthat)
dotest <- function(maxk, maxn, expected) {
  actual <- doubles(maxk, maxn)
  expect_equal(actual, expected, tol = 1e-6, scale = 1, info = "")
}
test_that("test doubles", {
  dotest(1, 10, 0.5580321939764581)
  dotest(10, 1000, 0.6921486500921933)
  dotest(10, 5000, 0.6929472124031200)
})
