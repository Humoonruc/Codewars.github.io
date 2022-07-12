
# 斐波那契数列对应的线性变换
F = [0 1; 1 1]

nthfibo(n::Integer) = (F^(n-1)*[0, 1])[1]

using Test
@test nthfibo(4) == 2