function score(word)
  word |> collect .|> (char -> char - 'a') |> sum
end

function high(x)
  vector_words = x |> split
  vector_score = vector_words .|> score
  max_index = findmax(identity, vector_score)[2]
  vector_words[max_index]
end



using Test
@test high("man i need a taxi up to ubud") == "taxi"
@test high("what time are we climbing up the volcano") == "volcano"