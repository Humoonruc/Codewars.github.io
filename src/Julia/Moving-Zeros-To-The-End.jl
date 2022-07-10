
function is_zero(x)
  x == 0 && typeof(x) == Int64
end

function moveZeros(arr)
  [arr[.!is_zero.(arr)]..., arr[is_zero.(arr)]...]
  # [filter(x -> !is_zero(x), arr)..., filter(is_zero, arr)...]
end

moveZeros([false, 1, 0, 1, 2, 0, 1, 3, "a"])
