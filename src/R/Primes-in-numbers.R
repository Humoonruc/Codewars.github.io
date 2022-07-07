## prime-factors

library(tidyverse)


#' 因数分解
#' @details 先记录所有的因子，再用 table() 统计频数
primeFactors <- function(n) {
  factors <- numeric(0)
  while (n %% 2 == 0) {
    n <- n / 2
    factors[[length(factors) + 1]] <- 2
  }
  for (i in seq(3, floor(sqrt(n)), 2)) {
    while (n %% i == 0) {
      n <- n / i
      factors[[length(factors) + 1]] <- i
    }
  }
  if (n > 1) { # 还剩一个大质数未被整除
    factors[[length(factors) + 1]] <- n
  }

  exponents <- table(factors)
  prime_factors <- names(exponents)

  map2_chr(
    .x = prime_factors, .y = exponents,
    .f = function(factor, exponent) {
      if (exponent == 1) {
        str_c("(", factor, ")")
      } else {
        str_c("(", factor, "**", exponent, ")")
      }
    }
  ) %>%
    str_c(collapse = "")
}


library(testthat)
testing <- function(n, expected) {
  actual <- primeFactors(n)
  expect_equal(actual, expected)
}

test_that("tests", {
  testing(7775460, "(2**2)(3**3)(5)(7)(11**2)(17)")
  testing(7919, "(7919)")
})
