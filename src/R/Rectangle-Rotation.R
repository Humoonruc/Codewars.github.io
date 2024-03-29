## rectangle-rotation


library(tidyverse)


#' @title 计算倾斜45°的矩形内有多少个整数交点
#' @details 示意图 https://files.gitter.im/myjinxin2015/raYf/blob
#' @param a 矩形的高
#' @param b 矩形的宽
rectangle_rotation <- function(a, b) {

  # 解法一：遍历整数交点
  # N <- floor((a + b) / (2 * sqrt(2)))
  # sum <- 0
  # for (x0 in -N:N) {
  #   for (y0 in -N:N) {
  #     # 整数交点逆时针旋转45°后，是否在摆正的矩形内
  #     x <- x0 / sqrt(2) - y0 / sqrt(2)
  #     y <- x0 / sqrt(2) + y0 / sqrt(2)
  #     if (between(x, -b / 2, b / 2) && between(y, -a / 2, a / 2)) {
  #       sum <- sum + 1
  #     }
  #   }
  # }
  # sum


  # 解法二：观察图形中整数交点点阵的规律
  # 倾角45°的交点行，从右上到左下，第一行三个点，相距sqrt(2)
  # 下一行两个点，相距sqrt(2)，下一行又是三个点……
  # 三个点的行之间的距离为sqrt(2)，两个点的行同样
  # 所以，所有三个点的行，构成了一个单位长度为sqrt(2)的点阵
  # 同样，所有两个点的行，也构成了一个单位长度为sqrt(2)的点阵
  # 总交点数，就是这两个矩形点阵交点数的和

  # # 第一个点阵的宽度方向的交点数
  # b1 <- ((b / 2) %/% sqrt(2)) * 2 + 1
  # # 第一个点阵的长度方向的交点数
  # a1 <- ((a / 2) %/% sqrt(2)) * 2 + 1
  # # 第一个点阵的交点数
  # n1 <- a1 * b1

  # # 第二个点阵的宽度方向的交点数
  # b2 <- ((b / 2 - sqrt(2) / 2) %/% sqrt(2) + 1) * 2
  # # 第二个点阵的长度方向的交点数
  # a2 <- ((a / 2 - sqrt(2) / 2) %/% sqrt(2) + 1) * 2
  # # 第二个点阵的交点数
  # n2 <- a2 * b2

  # return(n1 + n2)


  # 可将上述代码化简为：
  h <- a %/% sqrt(2)
  v <- b %/% sqrt(2)
  n1 <- (v %/% 2 * 2 + 1) * (h %/% 2 * 2 + 1)
  n2 <- ((v + 1) %/% 2) * 2 * ((h + 1) %/% 2) * 2
  return(n1 + n2)
}


library(testthat)
test_that("basic tests", {
  expect_equal(rectangle_rotation(6, 4), 23)
  expect_equal(rectangle_rotation(30, 2), 65)
  expect_equal(rectangle_rotation(8, 6), 49)
  expect_equal(rectangle_rotation(16, 20), 333)
})
