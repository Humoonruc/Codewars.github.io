# Valid-Parentheses.jl

using Test


"""
合法的括号
"""
function validparentheses(parens::String)::Bool
    num = 0
    for c in parens
        # 利用短路运算，Julia 特有语法，因任何表达式都有返回值
        c == '(' && (num += 1)
        c == ')' && (num -= 1)
        num < 0 && return false
    end
    num == 0
end


@test validparentheses("()") == true
@test validparentheses("())") == false