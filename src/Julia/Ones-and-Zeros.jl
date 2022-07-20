

using Test


"""
二进制各位数字向量转换为10进制数字
"""
function binaryarraytonumber(arr::Vector{Int64})::Int64
    # 解法一：二元函数 (i, x) 的向量化操作
    # [x * 2^(i - 1) for (i, x) ∈ enumerate(reverse(arr))] |> sum

    # 解法二：解析二进制字符串为10进制整数
    parse(Int, join(arr), base=2)
end


@test binaryarraytonumber([0, 1, 1, 0]) == 6