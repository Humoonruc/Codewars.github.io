library(tidyverse)
toCamelCase <- function(string) {
  string %>%
    str_replace_all("[-_]\\w", function(x) {
      toupper(str_sub(x, 2))
    })
}


toCamelCase("the-stealth-warrior")
