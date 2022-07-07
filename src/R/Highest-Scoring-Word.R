# 可读性不好，要大改

library(tidyverse)

high <- function(x) {
  words <- x %>%
    str_split(" ") %>%
    unlist()

  max_index <- words %>%
    map_int(function(w) {
      w %>%
        str_split("") %>%
        unlist() %>%
        map_int(~ match(.x, letters)) %>%
        sum()
    }) %>%
    which.max()

  words[max_index]
}
