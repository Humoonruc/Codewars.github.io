

rearrange(str::String)::String = collect(str) |> sort |> join


"""
words 中与 word 拥有相同字母的元素
"""
function anagrams(word::String, words::Vector{String})::Vector{String}
    filter(w -> rearrange(w) == rearrange(word), words)
end


anagrams("abba", ["aabb", "abcd", "bbaa", "dada"])