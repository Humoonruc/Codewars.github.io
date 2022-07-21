library(tidyverse)
library(magrittr)


dirReduc <- function(arr) {
    # 用 named vector 起到其他语言中 Dict/Map 的作用
    opposite_dir <- c("NORTH", "SOUTH", "EAST", "WEST") %>%
        set_names(c("SOUTH", "NORTH", "WEST", "EAST"))

    stack <- character(0)

    for (step in arr) {
        n <- length(stack)
        if (n > 0 && opposite_dir[step] == stack[n]) {
            stack <- stack[-n]
        } else {
            stack[n + 1] <- step
        }
    }

    stack
}



library(testthat)
testing <- function(ls, expected) {
    actual <- dirReduc(ls)
    expect_equal(actual, expected)
}
test_that("tests", {
    a <- c("NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST")
    testing(a, c("WEST"))
    a <- c("NORTH", "WEST", "SOUTH", "EAST")
    testing(a, c("NORTH", "WEST", "SOUTH", "EAST"))
    a <- c("NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "NORTH")
    testing(a, c("NORTH"))
})
