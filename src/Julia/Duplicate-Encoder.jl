
using DataStructures


"""
出现多于1次的字符编码为右括号，只有1次的为左括号
"""
function duplicateencode(word)
  lower_word = lowercase(word)
  dict = counter(lower_word)
  encode(c) = dict[c] > 1 ? ')' : '('

  map(encode, lower_word)
end




# Testing
using Test
@test duplicateencode("Success") == ")())())"
