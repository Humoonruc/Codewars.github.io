function isvalidwalk(walk)
  [length(walk) == 10,
    sum(walk .== 'n') == sum(walk .== 's'),
    sum(walk .== 'e') == sum(walk .== 'w')] |> all
end


using Test
@test isvalidwalk(['n', 's', 'n', 's', 'n', 's', 'n', 's', 'n', 's']) == true