## Number of trailing zeros of N!

library(tidyverse)


#' @title 计算 n! 末尾 0 的个数
#' @description 即计算 n! 的因子中共有多少个5
#' 因为 2 的个数必然大于 5，所以有多少个 5 就有多少个10
#' 先计算 1:n 中有多少个数可以被 5 整除
#' 再计算有多少个可以被 25、125 整除，依此类推
zeros <- function(n) {
  if (n == 0) {
    return(0)
  }

  # 循环写法
  count <- 0
  div <- 5
  while (n %/% div > 0) {
    count <- count + n %/% div
    div <- div * 5
  }
  count

  # 递归写法
  n %/% 5 + zeros(n %/% 5)

  # 向量化写法
  exponential <- floor(log(n, 5)) # 1:n中包含的5的最大指数
  divs <- 5^(1:exponential)
  sum(n %/% divs)
}


library(testthat)
expect_equal(zeros(0), 0)
expect_equal(zeros(6), 1)
expect_equal(zeros(30), 7)
expect_equal(zeros(1000), 249)
