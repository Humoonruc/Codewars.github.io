## Mean without outliers

library(tidyverse)


not_outlier <- function(x, mean, std, cutoff) {
  abs(x - mean) <= cutoff * std
}


#' @title calculate mean of a sample without outliers
#' @param sam a sample
#' @param cutoff 评估一个样本点是否为 outlier 的参数
#'    当一个样本点的离差大于标准差的 cutoff 倍时，认为它是 outlier
clean_mean <- function(sample, cutoff) {
  while (TRUE) { # 无限循环，满足条件时用 return() 跳出
    m <- mean(sample)
    n <- length(sample)
    sd <- sqrt((1 / n) * sum((sample - m)^2))
    sample_without_outlier <- sample %>% keep(~ not_outlier(.x, m, sd, cutoff))

    if (length(sample_without_outlier) == n) {
      return(m)
    } else {
      sample <- sample_without_outlier
    }
  }
}


library(testthat)
test_that("Example Tests", {
  sam <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100)
  cutoff <- 3
  expect_equal(clean_mean(sam, cutoff), 5.5)
})
