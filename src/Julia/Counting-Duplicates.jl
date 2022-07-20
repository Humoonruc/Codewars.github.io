## Counting-Duplicates.jl

using DataStructures, Test


"""
    duplicatecount(str)

计算str中出现次数多于1次的字符的个数

# Example
```jldoctest
julia> duplicatecount("aabbcde")
2
```
"""
function duplicatecount(str::String)::Int64
    dict = str |> lowercase |> counter
    # @show dict

    # broadcast() 的参数可以是 iterator
    # .> 返回 BitVector，可以传给 sum()
    sum(values(dict) .> 1)

    # filter(>(1), [values(dict)...]) |> length # 等价形式
end



@testset "Sample tests" begin
    @test duplicatecount("") == 0
    @test duplicatecount("abcde") == 0
    @test duplicatecount("aabbcde") == 2
    @test duplicatecount("aabBcde") == 2
    @test duplicatecount("Indivisibility") == 1
    @test duplicatecount("Indivisibilities") == 2
end