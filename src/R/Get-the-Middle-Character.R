## Get the Middle Character

#' @title 提取字符串中间的一个或两个字母
get_middle <- function(string) {
  m <- median(1:nchar(string)) # middle letter index
  string |> str_sub(floor(m), ceiling(m))
}

library(testthat)
test_that("Sample Tests", {
  expect_equal(get_middle("test"), "es")
  expect_equal(get_middle("testing"), "t")
  expect_equal(get_middle("middle"), "dd")
  expect_equal(get_middle("A"), "A")
  expect_equal(get_middle("of"), "of")
})
