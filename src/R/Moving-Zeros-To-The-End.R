library(tidyverse)

moveZeros <- function(arr) {
  c(arr %>% keep(~ !identical(.x, 0)), arr %>% keep(~ identical(.x, 0)))
}

moveZeros(c(1, 2, 0, 1, 0, 1, 0, 3, 0, 1))
moveZeros(list(FALSE, 1, 0, 1, 2, 0, 1, 3, "a"))
