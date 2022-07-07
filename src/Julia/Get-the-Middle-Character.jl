## Get-the-Middle-Character.jl

using Statistics

"""
    getmiddle(s::String)::String
return middle character(s) of a string
"""
function getmiddle(s)
  m = median(1:length(s)) # median() 返回 Float
  s[Int(floor(m)):Int(ceil(m))]
end

using Test
@testset "Sample tests" begin
  @test getmiddle("test") == "es"
  @test getmiddle("testing") == "t"
end