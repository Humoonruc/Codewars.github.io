library(tidyverse)
library(magrittr)


# 写成返回两个值的函数，避免定义全局变量arr
# obj 包含两个分量：整数 n 和数组 arr
dict <- list(
  "i" = \(obj) list(n = obj$n + 1, arr = obj$arr),
  "d" = \(obj) list(n = obj$n - 1, arr = obj$arr),
  "s" = \(obj) list(n = obj$n^2, arr = obj$arr),
  "o" = \(obj) list(n = obj$n, arr = c(obj$arr, obj$n))
)


deadfish <- function(commands) {
  valid_commands <- commands %>%
    str_split("") %>%
    unlist() %>%
    keep(~ .x %in% c("i", "d", "s", "o"))

  # 此处不用 reduce 用 for 循环会更加清楚
  obj <- list(n = 0, arr = integer(0))
  for (char in valid_commands) {
    obj <- dict[[char]](obj)
  }
  obj$arr
}


library(testthat)
test_that("Unit Test", {
  expect_equal(deadfish("iiisxxxdoso"), c(8, 64))
})
