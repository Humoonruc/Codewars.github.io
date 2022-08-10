# Highest-Scoring-Word.jl


function get_score(word::String)::Int64
    word |> collect .|> (char -> char - 'a' + 1) |> sum
end


function high(x::String)::String
    words = x |> split .|> String # split 切割返回的数据类型为 SubString{String}  
    _, max_index = words .|> get_score |> findmax
    return words[max_index]
end


using Test
@testset "return word with highest score" begin
    @test high("man i need a taxi up to ubud") == "taxi"
    @test high("what time are we climbing up the volcano") == "volcano"
end