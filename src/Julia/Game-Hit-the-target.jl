function solution(A::Matrix{Char})::Bool
  arrow_indice = findfirst(c -> c == '>', A)
  target_indice = findfirst(c -> c == 'x', A)

  in_same_line = arrow_indice[1] == target_indice[1]
  order_is_right = arrow_indice[2] < target_indice[2]
  in_same_line && order_is_right
end


A = [
  ' ' ' ' ' ' ' ' ' '
  ' ' ' ' ' ' ' ' ' '
  ' ' ' ' ' ' ' ' ' '
  ' ' ' ' '>' ' ' 'x'
  ' ' ' ' ' ' ' ' ' '
]

solution(A)