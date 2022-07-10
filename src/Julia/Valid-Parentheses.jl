

"""
合法的括号
"""
function validparentheses(parens::String)::Bool
  num = 0
  for c in parens
    c == '(' && (num += 1)
    c == ')' && (num -= 1)
    num < 0 && return false
  end
  num == 0
end


using Test
@test validparentheses("()") == true
@test validparentheses("())") == false