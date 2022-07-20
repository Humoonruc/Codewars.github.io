
using Test


"""
只有 `>` 和 `x` 在同一行且 `>` 在 `x` 前，才返回 true
"""
function solution(A::Matrix{Char})::Bool
    arrow_indices = findfirst(==('>'), A) # 返回CartesianIndex{2}
    arrowᵢ, arrowⱼ = arrow_indices[1], arrow_indices[2]
    target_indices = findfirst(==('x'), A)
    targetᵢ, targetⱼ = target_indices[1], target_indices[2]

    return arrowᵢ == targetᵢ && arrowⱼ < targetⱼ
end


A = [
    ' ' ' ' ' ' ' ' ' '
    ' ' ' ' ' ' ' ' ' '
    ' ' ' ' ' ' ' ' ' '
    ' ' ' ' '>' ' ' 'x'
    ' ' ' ' ' ' ' ' ' '
]



@test solution(A) == true
