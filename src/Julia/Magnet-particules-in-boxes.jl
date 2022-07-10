


"""
通项公式为 1/k/(n+1)^(2k)  
对此公式交叉遍历 k 向量和 n 向量，求和
"""
function doubles(maxk::Int, maxn::Int)::Float64  
  v(k, n) = 1 / k / (big(n) + 1)^(2k) # 不转换Float64或BigInt会数值越界
  [v(k, n) for k ∈ 1:maxk for n ∈ 1:maxn] |> sum
end

doubles(10, 1000)



using Test
using Printf

function ifinrange(maxk, maxn, expect)
  merr = 1e-6 # max error
  actual = doubles(maxk, maxn)
  e = abs(actual - expect)
  inrange = e <= merr
  @printf("Expect %.12f\n", float(expect))
  @printf("Actual %.12f\n", float(actual))
  inrange
end

@testset "fixed tests" begin
  @test ifinrange(1, 10, 0.5580321939764581) == true
  @test ifinrange(10, 1000, 0.6921486500921933) == true
end
