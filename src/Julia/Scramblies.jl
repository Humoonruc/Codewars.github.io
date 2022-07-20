using DataStructures
using Test


"""
if a portion of str1 characters can be rearranged to match str2
"""
function scramble(str1::String, str2::String)
    dict1 = DataStructures.counter(str1)
    dict2 = DataStructures.counter(str2)

    [dict2[key] ≤ dict1[key] for key ∈ keys(dict2)] |> all
end


@test scramble("rkqodlw", "world") == true
@test scramble("cedewaraaossoqqyt", "codewars") == true
@test scramble("katas", "steak") == false