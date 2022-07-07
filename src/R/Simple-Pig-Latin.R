library(tidyverse)

replace_rule <- function(word) {
  str_c(str_sub(word, 2), str_sub(word, 1, 1), "ay")
}

pigIt <- function(string) {
  string %>%
    str_replace_all("\\w+", replace_rule)
}


library(testthat)
test_that("Sample Tests", {
  expect_equal(pigIt("Pig latin is cool"), "igPay atinlay siay oolcay")
  expect_equal(pigIt("Hello world !"), "elloHay orldway !")
})
