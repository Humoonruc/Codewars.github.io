library(tidyverse)

pyramid <- function(n) {
  1:n %>% map(~ rep(1, .x))
}

pyramid(3)
