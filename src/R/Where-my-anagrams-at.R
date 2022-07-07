library(tidyverse)

#' 挑选出 words 中所含字母与 word 相同的元素
anagrams <- function(word, words) {
  rearrange <- function(w) {
    w %>%
      str_split("") %>%
      unlist() %>%
      sort() %>%
      str_c(collapse = "")
  }

  # 该问题的核心就是一步 filter
  words %>%
    keep(function(element) rearrange(element) == rearrange(word))
}

anagrams("abba", c("aabb", "abcd", "bbaa", "dada"))
