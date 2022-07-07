library(tidyverse)

#' 除最后四位全部打码
maskify <- function(string) {
  str_sub(string, start = -4L, end = -1L) %>%
    str_pad(nchar(string), side = "left", pad = "#")
}


library(testthat)
test_that("Sample Tests", {
  expect_equal(maskify("4556364607935616"), "############5616")
  expect_equal(maskify("1"), "1")
  expect_equal(maskify("11111"), "#1111")
})
