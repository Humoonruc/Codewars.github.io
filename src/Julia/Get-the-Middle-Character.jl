## Get-the-Middle-Character.jl

using Statistics


"""
return middle character(s) of a string
"""
function getmiddle(s::String)::String
  m = median(1:length(s))
  s[floor(Int, m):ceil(Int, m)] # median() 返回 Float
end


using Test
@testset "Sample tests" begin
  @test getmiddle("test") == "es"
  @test getmiddle("testing") == "t"
end