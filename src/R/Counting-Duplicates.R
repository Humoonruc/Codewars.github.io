## Counting Duplicates

library(tidyverse)


#' @title 统计字符串中有几个字符的出现次数大于1
duplicate_count <- function(text) {
  frequency <- tolower(text) %>%
    str_split("") %>%
    unlist() %>%
    table()

  # 向量化写法
  sum(frequency > 1)
}


library(testthat)
test_that("Sample Tests", {
  expect_equal(duplicate_count(""), 0)
  expect_equal(duplicate_count("abcdeaa"), 1)
  expect_equal(duplicate_count("Indivisibilities"), 2)
})
