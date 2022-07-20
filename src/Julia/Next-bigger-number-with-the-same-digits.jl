using Test


#########################################
# 解法一
#########################################

"""
If the last k digits of a number follow a reverse order

# Arguments
- `vec`, digits vector of the number
- `k`
"""
function latter_is_rev(vec::Vector, k::Int64)
    last = vec[end-k+1:end]
    last |> sort |> reverse == last ? true : false
end


@testset "check reverse on last k digits" begin
    @test latter_is_rev([1, 3, 2], 2) == true
    @test latter_is_rev([1, 3, 2], 3) == false
end


"""
得知后k-1位皆为逆序但后k位不是逆序后
计算 next bigger arrangement
"""
function render_bigger(vec::Vector, k::Int64)
    latterₖ = vec[end-k+1:end]

    # 后k位中刚刚大于后第k位（即正第end-k+1位）的数字，排到后第k位上
    # 由于后k-1位的逆序性质，用 findlast()
    new₋ₖ_index = findlast(>(vec[end-k+1]), latterₖ)
    new₋ₖ_value = latterₖ[new₋ₖ_index]

    # 后k位中其余的数字顺序排列（尽可能小），作为新的后k-1列
    new_latterₖ₋₁ = sort([x for (i, x) ∈ enumerate(latterₖ) if i ≠ new₋ₖ_index])
    [vec[1:end-k]..., new₋ₖ_value, new_latterₖ₋₁...] |> join |> x -> parse(Int64, x)
end

@testset "render next bigger number" begin
    @test render_bigger([1, 2, 3], 2) == 132
    @test render_bigger([1, 3, 2], 3) == 213
end


function nextbigger(n::Int64)
    vec = digits(n) |> reverse
    for k ∈ 2:length(vec)
        !latter_is_rev(vec, k) && return render_bigger(vec, k)
    end
    return -1
end

@testset "next bigger" begin
    @test nextbigger(123456789) == 123456798
    @test nextbigger(1234567890) == 1234567908
    @test nextbigger(9876543210) == -1
    @test nextbigger(9999999999) == -1
    @test nextbigger(59884848459853) == 59884848483559
end




#########################################
# 解法二
#########################################

function nextbigger(n::Int64)
    numbers = n |> digits |> sort # 所有数字的升序排列
    test = n

    digits(n) == numbers && return -1

    while true
        test += 1 # 在n的基础上自增，最快实现这些数字重排列的就是next bigger
        test |> digits |> sort == numbers && return test
    end
end

@testset "next bigger" begin
    @test nextbigger(123456789) == 123456798
    @test nextbigger(1234567890) == 1234567908
    @test nextbigger(9876543210) == -1
    @test nextbigger(9999999999) == -1
    @test nextbigger(59884848459853) == 59884848483559
end