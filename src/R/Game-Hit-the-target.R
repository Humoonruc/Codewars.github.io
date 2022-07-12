library(tidyverse)


solution <- function(M) {
  # 将M沿列展开为向量的一维坐标
  arrow_index <- match(">", M)
  target_index <- match("x", M)

  # 二维坐标中的行
  arrow_i <- arrow_index %% nrow(M)
  target_i <- target_index %% nrow(M)

  arrow_i == target_i && arrow_index < target_index
}


M <- c(rep(" ", 17), ">", " ", "x", rep(" ", 5)) %>%
  matrix(nrow = 5, ncol = 5, byrow = TRUE)

solution(M)
