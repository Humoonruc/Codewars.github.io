using Test


##########################################
# 解法一
##########################################

function product_fib1(prod)
    a, b = big(0), big(1)
    while a * b < prod
        a, b = b, a + b
    end
    return (a, b, a * b == prod)
end

@test product_fib1(5456077604922913920) == (2971215073, 4807526976, false)


##########################################
# 解法二
##########################################

const M_Fibonacci = [0 1; 1 1]

function fib2(n::Int64)::Tuple{Int64,Int64}
    aₙ, aₙ₊₁ = M_Fibonacci^n * [0, 1]
    return aₙ, aₙ₊₁
end

function product_fib2(prod::Integer)::Tuple{Int64,Int64,Bool}
    k = 1
    while true
        a, b = fib2(k) .|> big
        @show a * b
        a * b == prod && return (a, b, true)
        a * b > prod && return (a, b, false)
        k += 1
    end
end

@test product_fib2(5456077604922913920) == (2971215073, 4807526976, false)