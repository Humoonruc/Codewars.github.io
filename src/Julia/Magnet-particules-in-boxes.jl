# 公式为 1/maxk/(n+1)^(2maxk)
# 先要对此公式交叉遍历 maxk 向量和 n 向量
# 最后求和


function doubles(maxk, maxn)
  v(k, n) = 1 / k / (Float64(n) + 1)^(2k)
  [v(k, n) for k in 1:maxk for n in 1:maxn] |> sum
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
