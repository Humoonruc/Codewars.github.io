## Descending-Order.jl

using Pipe, Test


"""
使n的各位数字降序排列
"""
function descending_order(n::Int)::Int
    @pipe n |> string |> collect |> sort |> reverse |> join |> parse(Int64, _)
end

@test descending_order(42145) == 54421