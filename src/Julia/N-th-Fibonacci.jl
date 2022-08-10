using Test

# 斐波那契数列对应的线性变换
F = [0 1; 1 1]

nthfibo(n::Int64)::Int64 = (F^(n-1)*[0, 1])[1]

@test nthfibo(4) == 2