using Test


##################################
# 解法一
##################################
"""
rules是依赖于一个初始化容器的
"""
gender_rules(output::Vector{Int64})::Dict{Char,Function} =
    Dict(
        'i' => x -> x + 1,
        'd' => x -> x - 1,
        's' => x -> x^2,
        'o' => x -> push!(output, x)[end]
        # 一行内既改变了output又返回了x
    )


function deadfish1(commands::String)::Vector{Int64}
    # initialize
    x = 0
    output = Int64[]

    # gender rules
    rules = gender_rules(output)

    # operation
    valid_commands = filter(∈("idso"), commands)
    for c in valid_commands
        x = rules[c](x) # 串行loop
    end

    return output
end

@test deadfish1("iiisxxxdoso") == [8, 64]


##################################
# 解法二
##################################

# 写成返回两个值的函数，dict独立为不依赖其他变量的const
# 更彻底地解耦，使程序易于维护
const rules2 = Dict{Char,Function}(
    'i' => (x, arr) -> (x + 1, arr),
    'd' => (x, arr) -> (x - 1, arr),
    's' => (x, arr) -> (x^2, arr),
    'o' => (x, arr) -> (x, push!(arr, x))
)


function deadfish2(commands::String)::Vector{Int64}
    # initialize
    x = 0
    output = Int64[]

    # operation
    valid_commands = filter(∈("idso"), commands)
    for c in valid_commands
        x, output = rules2[c](x, output) # 串行操作
    end

    return output
end

@test deadfish2("iiisxxxdoso") == [8, 64]