library(tidyverse)

#' 整数各位数字降序排列
#' @param n 整数
#' @return 整数
descending_order <- function(n) {
  n %>%
    as.character() %>%
    str_split("") %>% # 注意，该函数返回列表
    unlist() %>%
    sort(decreasing = TRUE) %>% # 可直接对字符排序
    str_c(collapse = "") %>%
    as.integer()
}

descending_order(42145) # 54421
