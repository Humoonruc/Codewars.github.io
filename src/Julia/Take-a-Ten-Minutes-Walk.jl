

"""
valid walk 的标准为：走十步并回到原点
"""
function isvalidwalk(walk)
  [length(walk) == 10,
    sum(walk .== 'n') == sum(walk .== 's'),
    sum(walk .== 'e') == sum(walk .== 'w')] |> all
end


using Test
@test isvalidwalk(['n', 's', 'n', 's', 'n', 's', 'n', 's', 'n', 's']) == true