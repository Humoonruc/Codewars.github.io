# Calculating-with-Functions.jl


"""
返回一个闭包
"""
function ClosureFactory(x)
    # 此处不能写成匿名函数的形式，因为匿名函数没有默认参数
    closure(f=nothing) = isnothing(f) ? x : f(x) # return a closure
end

# methods(ClosureFactory(-2))

using Test
@testset "Closure factory working tests" begin
    @test ClosureFactory(-2)() == -2
    @test ClosureFactory(-2)(abs) == 2
    @test ClosureFactory(-2)(sqrt ∘ abs) == √2
end


# 10 closures
zero, one, two, three, four, five, six, seven, eight, nine = ClosureFactory.(0:9)


# 4 operator closure factories
plus(k) = x -> x + k
minus(k) = x -> x - k
times(k) = x -> x * k
dividedBy(k) = x -> x / k


@testset "Fuctional Programming tests" begin
    @test eight(minus(three())) == 5
    @test seven(times(five())) == 35
end