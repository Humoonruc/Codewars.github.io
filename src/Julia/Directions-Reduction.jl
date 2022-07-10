

# 有对应关系时，经常可以用 Dict 化简代码
const OppositeDir = Dict(
  "NORTH" => "SOUTH",
  "EAST" => "WEST",
  "SOUTH" => "NORTH",
  "WEST" => "EAST"
)


"""
简化无效路径
"""
function dir_reduc(arr)
  stack = []

  for step ∈ arr
    # short-circuit logic：当stack为空时，stack[end]根本不会运行
    if !isempty(stack) && (stack[end] => step) ∈ OppositeDir
      pop!(stack)
    else
      push!(stack, step)
    end
  end

  stack
end


using Test
@test dir_reduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]) == ["WEST"]


