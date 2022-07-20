## Decimal-to-Factorial-and-Back.jl

using Pipe, Test


const code = ['0':'9'; 'A':'Z']
const encode = Dict(i - 1 => code[i] for i = 1:length(code))
const decode = Dict(code[i] => i - 1 for i = 1:length(code))


"""
将整数线性分解为一组基，返回系数连接成的字符串
"""
function dec2FactString(nb::Int)::String
    # 先找最大的基
    max_base = 1
    while factorial(max_base + 1) <= nb
        max_base += 1
    end

    # 从大到小，确定每个基对应的系数
    factors = ""
    for base ∈ max_base:-1:0
        factors *= encode[nb÷factorial(base)] # 这里的*表示字符串连接
        nb %= factorial(base)
    end

    factors
end

@test dec2FactString(463) == "341010"



"""
已知基（阶乘）和系数连接成的字符串，计算整数
"""
function factString2Dec(str::String)::Int
    # 逆序的系数向量
    factors = @pipe collect(str) .|> decode[_] |> reverse

    # 基向量，从 0! 到 max_base!
    bases = 0:(length(factors)-1) .|> factorial

    sum(factors .* bases)
end

@test factString2Dec("341010") == 463