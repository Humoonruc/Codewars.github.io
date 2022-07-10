## Decimal-to-Factorial-and-Back.jl


code = ['0':'9'; 'A':'Z']
encode = Dict(i - 1 => code[i] for i = 1:length(code))
decode = Dict(code[i] => i - 1 for i = 1:length(code))


"""
将整数线性分解为一组基，返回系数字符串
"""
function dec2FactString(nb::Int)::String
  # 先找最大的基
  max_base = 1
  while factorial(max_base + 1) <= nb
    max_base += 1
  end

  # 从大到小，确定每个基对应的系数
  factors = ""
  for base ∈ [max_base:-1:0...]
    factors *= encode[nb÷factorial(base)] # 这里的*表示字符串连接
    nb %= factorial(base)
  end

  factors
end

dec2FactString(463)


function factString2Dec(str::String)::Int
  # 逆序的系数向量
  factors = collect(str) .|> (ch -> decode[ch]) |> reverse

  # 基向量，从 0! 到 max_base!
  bases = 0:(length(factors)-1) .|> factorial

  factors .* bases |> sum
end

factString2Dec("341010")