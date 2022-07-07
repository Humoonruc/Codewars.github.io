function moveZeros(arr)
  is_zero(x) = typeof(x) == Int64 && x == 0
  vcat(filter(x -> !is_zero(x), arr), filter(is_zero, arr))
end

moveZeros([false, 1, 0, 1, 2, 0, 1, 3, "a"])