# Unique-In-Order.R

library(tidyverse)


unique_in_order <- function(arr) {
    if (is.character(arr) && length(arr) == 1) {
        arr <- unlist(str_split(arr, ""))
    }

    output <- c()

    arr %>%
        walk(function(x) {
            if (length(output) == 0) {
                output <<- c(output, x)
            } else if (x != output[length(output)]) {
                output <<- c(output, x)
            }
        })

    output
}


unique_in_order(c(1, 2, 2, 3, 3, 3))
unique_in_order("aabbbccaa")