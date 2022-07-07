## Duplicate Encoder

library(tidyverse)


#' @title 重复字符编码器
#' @description 只出现一次的字符转换为"("；出现多次的字符转换为")"
duplicate_encode <- function(word) {
  # 字符串拆解为字符向量
  chars <- tolower(word) %>%
    str_split("") %>%
    unlist()

  # 统计频数
  frequency <- table(chars)

  chars %>%
    map_chr(function(ch) {
      ifelse(frequency[ch] == 1, "(", ")")
    }) %>%
    str_c(collapse = "")
}

duplicate_encode("Success")


library(testthat)
test_that("Sample Tests", {
  expect_equal(duplicate_encode("din"), "(((")
  expect_equal(duplicate_encode("recede"), "()()()")
  expect_equal(duplicate_encode("Success"), ")())())", "should ignore case")
  expect_equal(duplicate_encode("CodeWarrior"), "()(((())())")
  expect_equal(duplicate_encode("(( @"), "))((")
})
