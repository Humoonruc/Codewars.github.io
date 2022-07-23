
"""
将n转换为二进制后，各位数字中有多少个1
"""
function countbits(n::Int64)::Int64
    # 用 string(n; base=10) 解析
    string(n, base=2) |> collect |> arr -> count(==('1'), arr)

    # 用 digits(n; base=10) 解析
    digits(n, base=2) |> sum
end


using Test
@test countbits(190) == 6