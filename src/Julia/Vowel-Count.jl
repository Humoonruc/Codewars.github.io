

using Test


"""
count vowels of lowercase in a sentence
"""
function getcount(s::String)::Int
    count(∈("aeiou"), s)
end


@testset "vowel count" begin
    @test getcount("I am a doctor.") == 4
end