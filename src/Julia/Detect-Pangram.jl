

"""
检测字符串是否包含所有26个字母
"""
function is_pangram(string)
  # all() 接收 iterator，里面是一个 BitVector
  all('a':'z' .∈ lowercase(string))
end


using Test
@test is_pangram("The quick, brown fox jumps over the lazy dog!") == true