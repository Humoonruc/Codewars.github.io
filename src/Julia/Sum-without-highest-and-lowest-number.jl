using Test


"""
去掉一个最高分，去掉要给最低分，求和  
输入检查，有可能是 nothing
"""
function sumarray(arr)::Real
    (isnothing(arr) || length(arr) ≤ 2) && return 0
    sum(arr) - maximum(arr) - minimum(arr)
    # sort(arr)[2:(end-1)] |> sum
end

@test sumarray([6, 2, 1, 8, 10]) == 16
