library(tidyverse)
Matrix <- modules::use("./src/R/toolkit/Matrix.R")

nthfibo <- function(n) {
    matrix_pow <- Matrix$`%^%`
    F <- c(0, 1, 1, 1) %>% matrix(2)

    (matrix_pow(F, n - 1) %*% c(0, 1))[1, 1]
}

nthfibo(4) == 2
