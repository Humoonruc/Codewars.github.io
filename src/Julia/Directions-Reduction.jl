# Directions-Reduction.jl

using Test

# 有对应关系时，经常可以用 Dict 化简代码
const opposite = Dict(
    "NORTH" => "SOUTH",
    "EAST" => "WEST",
    "SOUTH" => "NORTH",
    "WEST" => "EAST"
)


"""
简化无效路径
"""
function dir_reduc(arr::Vector{String})::Vector{String}
    stack = []

    for step ∈ arr
        if isempty(stack)
            push!(stack, step) # 只要栈空了，就填新元素
        else
            opposite[step] == stack[end] ? pop!(stack) : push!(stack, step)
        end
    end

    stack
end

@test dir_reduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]) == ["WEST"]