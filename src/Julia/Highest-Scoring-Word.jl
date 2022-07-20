# Highest-Scoring-Word.jl

using Test


"""
word 是字符串切割的产物，数据类型为 SubString{String}  
其父类为 AbstractString
"""
function get_score(word::AbstractString)::Int64
    # @show typeof(word)
    word |> collect .|> (char -> char - 'a' + 1) |> sum
end


function high(x::String)::String
    words = x |> split
    _, max_index = words .|> get_score |> findmax
    return words[max_index]
end


@test high("man i need a taxi up to ubud") == "taxi"
@test high("what time are we climbing up the volcano") == "volcano"