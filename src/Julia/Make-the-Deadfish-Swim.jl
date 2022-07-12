

# 写成返回两个值的函数，避免定义全局变量arr
# 更彻底地解耦，使程序易于维护
dict = Dict(
  'i' => (x, arr) -> (x + 1, arr),
  'd' => (x, arr) -> (x - 1, arr),
  's' => (x, arr) -> (x^2, arr),
  'o' => (x, arr) -> (x, push!(arr, x))
)


function deadfish(data)
  valid_commands = filter(c -> c ∈ "idso", data)
  x, output = 0, [] # 初始值
  for c in valid_commands
    x, output = dict[c](x, output) # 串行操作
  end
  return output
end


using Test
@test deadfish("iiisxxxdoso") == [8, 64]