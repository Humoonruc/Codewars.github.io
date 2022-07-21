using Pipe, Test


function to_title_case(sentence::String, minorWords::String="")::String
    word_list = sentence |> split
    minor_list = minorWords |> split
    if_keep_lower(index, word) = index > 1 && lowercase(word) ∈ lowercase.(minor_list)
    deal_word(index, word) = if_keep_lower(index, word) ? lowercase(word) : titlecase(word)

    @pipe [deal_word(i, w) for (i, w) ∈ enumerate(word_list)] |> join(_, " ")
end


@testset "Unit Test" begin
    @test to_title_case("a clash of KINGS", "a an the of") == "A Clash of Kings"
    @test to_title_case("THE WIND IN THE WILLOWS", "The In") == "The Wind in the Willows"
    @test to_title_case("the quick brown fox") == "The Quick Brown Fox"
end