# Highest-Scoring-Word.R

library(tidyverse)
library(testthat)


get_value <- function(word) {
  word %>%
    str_split("") %>%
    unlist() %>%
    map_int(~ match(.x, letters)) %>%
    sum()
}


high <- function(x) {
  words <- x %>%
    str_split(" ") %>%
    unlist()
  values <- words %>% map_int(get_value)
  words[which.max(values)]
}


# unit test
test_that("Sample Tests", {
  expect_equal(high("what time are we climbing up the volcano"), "volcano")
})
