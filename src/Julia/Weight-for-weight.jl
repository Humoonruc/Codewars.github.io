using Pipe

"""
比较两个数字，先比较各位数字之和
若相等再比较字符向量
"""
function sort_rule(n::Int64)::Vector
    digit_arr = n |> digits |> reverse
    [sum(digit_arr), digit_arr]
end


function order_weight(s::String)::String
    numbers = @pipe s |> split .|> parse(Int64, _)
    @pipe sort(numbers, by=sort_rule) |> join(_, " ")
end


using Test
@test order_weight("103 90 123 180 4444 99 2000") == "2000 103 123 180 90 4444 99"