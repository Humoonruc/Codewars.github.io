

"""
count vowels of lowercase in a sentence
"""
function getcount(s::String)::Int
  count(c -> c ∈ "aeiou", s)
end



using Test
@testset "vowel count" begin
  @test getcount("I am a doctor.") == 4
end