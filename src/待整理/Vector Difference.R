## Vector Difference

library(tidyverse)


#' @title vector difference
#' @description subtracts one vector from another
array_diff <- function(a, b) {
  # 迭代
  a %>% discard(~ .x %in% b)

  # 向量化
  a[!(a %in% b)]
}

library(testthat)
test_that("Sample tests", {
  expect_equal(array_diff(c(1, 2), 1), 2)
  expect_equal(array_diff(c(1, 2, 2), 1), c(2, 2))
  expect_equal(array_diff(c(1, 2, 2), 2), 1)
  expect_equal(array_diff(c(1, 2, 2), numeric()), c(1, 2, 2))
  expect_equal(array_diff(numeric(), c(1, 2)), numeric())
  expect_equal(array_diff(c(1, 2, 3), c(1, 2)), 3)
})
