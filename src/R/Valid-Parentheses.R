library(tidyverse)

#' @title 检查括号对的匹配
valid_parentheses <- function(parens) {
  num <- 0

  char_vector <- parens %>%
    str_split("") %>%
    unlist()

  for (char in char_vector) {
    if (char == "(") num <- num + 1
    if (char == ")") num <- num - 1
    num < 0 && return(FALSE)
  }

  num == 0
}


valid_parentheses("()(()())")
