## Your order, please

library(tidyverse)


#' 一个句子的各单词中含数字，按照数字的顺序对单词重排序
your_order <- function(sentence) {
  words <- sentence %>%
    str_split(" ") %>%
    unlist()

  numbers <- words %>%
    map_dbl(readr::parse_number) # 用parse_number()提取数字，不用正则

  words[order(numbers)] %>% str_c(collapse = " ")
}


library(testthat)
test_that("Example Test", {
  expect_equal(your_order("is2 Thi1s T4est 3a"), "Thi1s is2 3a T4est")
})
