library(tidyverse)

binary2number <- function(arr) {
  # 向量化操作
  # map2_dbl(
  #   .x = rev(arr),
  #   .y = 0:(length(arr) - 1),
  #   .f = function(x, i) x * 2^i
  # ) %>% sum()

  # 转换 k 进制字符串为 10 进制整数
  str_c(arr, collapse = "") %>% strtoi(base = 2L)
}

library(testthat)
test_that("Sample Tests", {
  expect_equal(binary2number(c(0, 1, 1, 0)), 6)
})
