## Detect Pangram (全字母短句)

library(tidyverse)
library(magrittr)


#' 检查字符串中是否包含全部的英文字母（忽略大小写）
is_pangram <- function(string) {
  # string 中包含的所有字母（小写）
  chars <- string %>%
    tolower() %>%
    str_split("") %>%
    unlist() %>%
    unique()

  # 向量化检查
  letters %in% chars %>% all()
}


library(testthat)
test_that("Example Test Cases", {
  pangram <- "The quick, brown fox jumps over the lazy dog!"
  expect_equal(is_pangram(pangram), TRUE)
})
