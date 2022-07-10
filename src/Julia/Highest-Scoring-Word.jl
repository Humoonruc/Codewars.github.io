

function get_score(word)
  word |> collect .|> (char -> char - 'a') |> sum
end

function high(x)
  words = x |> split
  scores = words .|> get_score
  max_index = findmax(identity, scores)[2]
  words[max_index]
end


using Test
@test high("man i need a taxi up to ubud") == "taxi"
@test high("what time are we climbing up the volcano") == "volcano"