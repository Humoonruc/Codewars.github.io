## Counting-Duplicates.jl

using DataStructures # 其中的 counter() 已经 export，可以直接用


"""
计算text中出现次数多于1次的字符的个数
"""
function duplicatecount(text::String)::Int64
  # 返回一个 struct，类型为 counter
  # 里面只装着一个计数的 Dict
  dict = text |> lowercase |> counter
  sum(values(dict) .> 1) # 向量化逻辑运算产生一系列 0/false 和 1/true
end


using Test
@testset "Sample tests" begin
  @test duplicatecount("") == 0
  @test duplicatecount("abcde") == 0
  @test duplicatecount("aabbcde") == 2
  @test duplicatecount("aabBcde") == 2
  @test duplicatecount("Indivisibility") == 1
  @test duplicatecount("Indivisibilities") == 2
end