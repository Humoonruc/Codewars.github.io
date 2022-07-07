## RGB To Hex Conversion

library(tidyverse)


#' @description Convert a number from decimal to hex.
#'   Any values out of [0, 255] must be rounded to the range
#' @param x 10 进制 integer
#' @return 补齐至两位的字符串，表示16进制的数字
convert2hex <- function(x) {
  max(0, min(x, 255)) %>% # round to [0, 255]
    as.hexmode() %>% # convert to 16 进制
    toupper() %>%
    str_pad(2, "left", "0")
}

rgb <- function(r, g, b) {
  c(r, g, b) %>%
    map_chr(convert2hex) %>%
    str_c(collapse = "")
}


library(testthat)
test_that("Example Tests", {
  expect_equal(rgb(0, 0, 0), "000000")
  expect_equal(rgb(1, 2, 3), "010203")
  expect_equal(rgb(255, 255, 255), "FFFFFF")
  expect_equal(rgb(254, 253, 252), "FEFDFC")
  expect_equal(rgb(-20, 275, 125), "00FF7D")
})
