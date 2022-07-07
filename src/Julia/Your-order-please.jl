using Pipe

function extract_number(s)
  @pipe match(r"\d", s).match |> parse(Int, _)
end

function order(words)
  @pipe words |> split |> sort(_, by=extract_number) |> join(_, " ")
end


using Test
@test order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"