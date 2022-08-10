# Valid-Parentheses.jl


"""
Checks to see if parenthesis are balanced
"""
function validparentheses(parens::String)::Bool
    num = 0
    for c in parens
        # 避免写 if...end
        # 利用短路运算，Julia 特有语法，因任何表达式都有返回值
        c == '(' && (num += 1)
        c == ')' && (num -= 1)
        num < 0 && return false
    end
    return num == 0
end


using Test
@testset "valid parantheses" begin
    @test validparentheses("()") == true
    @test validparentheses("())") == false
end