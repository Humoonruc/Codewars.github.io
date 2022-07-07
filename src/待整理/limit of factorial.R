## limit of factorial

library(tidyverse)


#' @title Calculates (1! + 2! + 3! + ... + n!) / n!
#' @description 事实上，该式的极限为 1
#' @details 结果向下保留6位小数
going <- function(n) {
  1 + sum(1 / cumprod(n:2)) %>% # 精髓的 comprod()，返回一个累计序列
    `*`(1e6) %>%
    floor() %>%
    `/`(1e6)
}



library(testthat)

dotest <- function(n, expected) {
  actual <- going(n)
  expect_equal(actual, expected)
}

test_that("tests going", {
  dotest(5, 1.275)
  dotest(6, 1.2125)
  dotest(7, 1.173214)
})
