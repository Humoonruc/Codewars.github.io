
function is_zero(arr::Vector)::Vector{Bool}
    map(x -> x == 0 && typeof(x) != Bool, arr)
end


function moveZeros(arr::Vector)::Vector
    [arr[.!is_zero(arr)]..., arr[is_zero(arr)]...]
end

moveZeros([false, 1, 0, 1, 2, 0, 1, 3, "a"])
