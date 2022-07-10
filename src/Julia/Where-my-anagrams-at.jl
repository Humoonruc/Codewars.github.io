

function anagrams(word, words)
  rearrange(string) = collect(string) |> sort |> join
  filter(w -> rearrange(w) == rearrange(word), words)
end

anagrams("abba", ["aabb", "abcd", "bbaa", "dada"])

