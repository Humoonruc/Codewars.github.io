# Look-and-say-numbers.R


library(tidyverse)
library(magrittr)


count_string <- function(s) {
    s %>%
        str_match_all(pattern = "(.)\\1*") %>%
        extract2(1) %>%
        apply(
            MARGIN = 1,
            FUN = \(row) str_c(nchar(row[1]), row[2])
            # 每行的第一个元素是匹配的全部字符，第二个是()中的字符
        ) %>%
        str_c(collapse = "")
}

count_string("112223")


lookandsay <- function(s, max_len) {
    1:max_len %>%
        map_chr(\(x) s <<- count_string(s)) # <<- 才能修改外部变量
    # <- 赋值表达式有返回值，可以 return()
}

lookandsay("1", 5)
