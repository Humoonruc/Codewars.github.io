library(tidyverse)
countSmileys <- function(array) {
    # str_detect() 支持向量化操作
    str_detect(array, "[:;][-~]?[)D]") %>% sum()
}


library(testthat)
test_that("Sample Tests", {
    expect_equal(countSmileys(c(":)", ";(", ";}", ":-D")), 2)
    expect_equal(countSmileys(c(";D", ":-(", ":-)", ";~)")), 3)
    expect_equal(countSmileys(c(";]", ":[", ";*", ":$", ";-D")), 1)
})
