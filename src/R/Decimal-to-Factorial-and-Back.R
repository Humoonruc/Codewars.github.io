## Decimal-to-Factorial-and-Back.R

library(tidyverse)


codes <- "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" %>%
  str_split("") %>%
  unlist()


#' 将 0:35 的阶乘视为一组基，将参数向这组基分解出系数
#' @param nb 待分解的整数
#' @return 系数数组的字符串
dec2FactString <- function(nb) {
  # 先找最大的基
  max_base <- 1
  while (factorial(max_base + 1) <= nb) {
    max_base <- max_base + 1
  }

  # 从大到小，确定每个基对应的系数
  x <- character(0)
  for (i in max_base:0) {
    x[length(x) + 1] <- codes[nb %/% factorial(i) + 1]
    nb <- nb %% factorial(i)
  }

  x %>% str_c(collapse = "")
}

dec2FactString(463)



#' 已知系数和基，求和
#' @param str 系数数组的字符串
#' @return 加总后的整数
factString2Dec <- function(str) {
  # 逆序的系数向量
  factors <- str %>%
    str_split("") %>%
    unlist() %>%
    rev() %>%
    map_dbl(function(char) which(codes == char) - 1)

  # 基向量
  bases <- 0:(length(factors) - 1) %>% factorial()

  sum(factors * bases)
}

factString2Dec("341010")


library(testthat)
testing1 <- function(nb, expected) {
  actual <- dec2FactString(nb)
  expect_equal(actual, expected)
}
testing2 <- function(str, expected) {
  actual <- factString2Dec(str)
  expect_equal(actual, expected)
}

test_that("tests dec2FactString", {
  testing1(2982, "4041000")
  testing1(463, "341010")
  testing1(36288000, "A0000000000")
  testing1(3628800054, "76A0000021000")
  testing1(1273928000, "27A0533231100")
  testing1(220, "140200")
  testing1(1936295, "5301133210")
  testing1(81440635, "204365543010")
  testing1(14808485, "40721200210")
  testing1(3395, "4411210")
  testing1(92, "33100")
  testing1(4881, "6431110")
  testing1(174720, "424400000")
  testing1(5897, "11102210")
  testing1(1947, "2410110")
  testing1(1575088, "4303332200")
  testing1(49124, "115113100")
  testing1(9376317, "25742343110")
  testing1(449, "332210")
  testing1(112, "42200")
  testing1(64269, "145123110")
  testing1(6742089, "18515001110")
  testing1(86565208, "218474232200")
  testing1(1806792694, "3929024133200")
  testing1(12942219, "35576140110")
})

test_that("tests factString2Dec", {
  testing2("4041000", 2982)
  testing2("27A0533231100", 1273928000)
  testing2("341010", 463)
  testing2("65341010", 34303)
  testing2("1461330110", 555555)
  testing2("13573044440000", 7890123456)
  testing2("1630614043233100", 1849669781372)
  testing2("150636011110", 58322193)
  testing2("1662032340200", 741017980)
  testing2("194B99466413200", 145612691086)
  testing2("51465021000", 18702054)
  testing2("445212100", 185318)
  testing2("1000100", 722)
  testing2("522200", 664)
  testing2("2000", 12)
  testing2("64C0048313011110", 8269501168833)
  testing2("2455221000", 916134)
  testing2("10A739302433010", 92262000091)
  testing2("1A20254533200", 885536614)
  testing2("3855031110", 1440081)
  testing2("14D4831766411000", 1739585710590)
  testing2("331703501110", 131284689)
  testing2("86CB45050343200", 740991913678)
  testing2("112086032303100", 94394539820)
  testing2("30A3700211000", 1474663950)
  testing2("156B92750141010", 121660182223)
})

yTests <- function() {
  i <- 0
  while (i < 20) {
    n <- floor(runif(1, 1000000, 12166018222))
    act <- factString2Dec(dec2FactString(n))
    expect_equal(act, n)
    i <- i + 1
  }
}
test_that("Random tests", {
  yTests()
})
