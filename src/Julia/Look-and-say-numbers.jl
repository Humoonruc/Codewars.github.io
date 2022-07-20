# Look-and-say-numbers.jl


"""
执行一轮，生成对字符串连续字符计数的新字符串
"""
function count_string(s::String)::String
    # 解法一：遍历
    # seq = []
    # k, n = s[1], 0
    # for c ∈ s
    #     c == k && (n += 1)
    #     if c != k
    #         push!(seq, "$n$k")
    #         k = c
    #         n = 1
    #     end
    # end
    # push!(seq, "$n$k")
    # seq |> join

    #  解法二：正则
    replace(s, r"(.)\1*" => m -> string(length(m)) * m[1])
end

count_string("112223")


"""
# Arguments
- `data::String`: starting string
- `n::Int`: number of turns
"""
function lookandsay(data::String, n::Int64)::Vector{String}
    # 利用赋值语句有返回值的特性
    [data = count_string(data) for _ ∈ 1:n]

    # 否则就必须写成这样，与for循环也差不多了
    # [
    #     begin
    #         data = count_string(data)
    #         data
    #     end for _ ∈ 1:n
    # ]
end

lookandsay("1", 5)