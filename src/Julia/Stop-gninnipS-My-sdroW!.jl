using Pipe

"""
翻转一个字符串中较长的单词   
"""
function spinwords(s::String)::String
  reverse_long_word = w -> length(w) < 5 ? w : reverse(w)
  return @pipe s |> split .|> reverse_long_word |> join(_, " ")
end


using Test
@testset "spin words" begin
  @test spinwords("Hey fellow warriors") == "Hey wollef sroirraw"
end