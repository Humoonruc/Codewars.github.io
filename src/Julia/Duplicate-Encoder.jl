
using DataStructures


function duplicateencode(word)
  lower_word = lowercase(word)
  dict = counter(lower_word)
  collect(lower_word) .|> (c -> dict[c] > 1 ? ')' : '(') |> join
  # map(c -> letter_dict[c] > 1 ? ')' : '(', lower_word)
end


# Testing
duplicateencode("Success")