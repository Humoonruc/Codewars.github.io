function longest_consec(str_vec::Array{String}, k::Int)::String
    n = length(str_vec)
    (n == 0 || k > n || k ≤ 0) && return ""


    # 解法一：计算每个字符串的size
    # width_vec = str_vec .|> length
    # @show width_vec

    # sum_consec_width_vec = [sum(width_vec[i:i+k-1]) for i ∈ 1:(n-k+1)]
    # @show sum_consec_width_vec

    # i = argmax(sum_consec_width_vec)
    # str_vec[i:i+k-1] |> join


    # 解法二：串联相邻字符串
    consec_vec = [join(str_vec[i:i+k-1]) for i ∈ 1:(n-k+1)]
    @show consec_vec
    consec_vec[argmax(consec_vec .|> length)]
end


using Test
@test longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"