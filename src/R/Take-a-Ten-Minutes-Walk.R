#' @description 10轮后恰好回到起点返回 TRUE，否则返回 FALSE
isValidWalk <- function(walk) {
  all(
    length(walk) == 10,
    sum(walk == "n") == sum(walk == "s"),
    sum(walk == "w") == sum(walk == "e")
  )
}
