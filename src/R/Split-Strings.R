library(tidyverse)

solution <- function(string) {
  string %>%
    str_c("_") %>%
    str_extract_all(".{2}") %>%
    `[[`(1)
}

library(testthat)
test_that("Sample Tests", {
  expect_equal(solution("abc"), c("ab", "c_"))
  expect_equal(solution("abcd"), c("ab", "cd"))
})