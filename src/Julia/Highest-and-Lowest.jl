using Pipe


"""
返回一组数的最大值和最小值

# Arguments
- `numbers::String`: 包含一组数字的字符串，用空格隔开
"""
function highandlow(numbers::String)::String
  @pipe numbers |> split .|> # split 默认分隔符为空格
        parse(Int, _) |> # 化为整数
        extrema |> # 返回 tuple，小数在前，大数在后
        reverse |>
        join(_, " ")
end


using Test
@testset "Example tests" begin
  @test highandlow("8 3 -5 42 -1 0 0 -9 4 7 4 -4") == "42 -9"
  @test highandlow("1 2 3") == "3 1"
end