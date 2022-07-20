using Pipe
using Test


reverse_long_word(w::AbstractString)::String = length(w) < 5 ? w : reverse(w)
@test reverse_long_word("Hey") == "Hey"
@test reverse_long_word("fellow") == "wollef"


"""
翻转一个字符串中较长的单词   
"""
function spinwords(s::String)::String
    @pipe s |> split .|> reverse_long_word |> join(_, " ")
end

@testset "spin words" begin
    @test spinwords("Hey fellow warriors") == "Hey wollef sroirraw"
end