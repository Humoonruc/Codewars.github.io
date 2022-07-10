## Descending-Order.jl

# 定义辅助函数，只接收一个参数，便于管道串联
parseInt(s) = parse(Int64, s)


"""
n作为字符串，其中字符降序排列
"""
function descending_order(n::Int)::Int
  n |> string |> collect |> sort |> reverse |> join |> parseInt
end

descending_order(42145)