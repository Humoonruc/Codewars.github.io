library(tidyverse)

scramble <- function(s1, s2) {
    table1 <- s1 %>%
        str_split("") %>%
        unlist() %>%
        table()


    table2 <- s2 %>%
        str_split("") %>%
        unlist() %>%
        table()


    map_lgl(
        .x = names(table2),
        .f = function(key) {
            if (!key %in% names(t1)) {
                return(FALSE)
            } else {
                return(table2[key] <= table1[key])
            }
        }
    ) %>%
        all()
}
