using Pipe
using Test


function extract_number(s::AbstractString)::Int64
    @pipe match(r"\d", s).match |> parse(Int, _)
end

@assert extract_number("T4est") == 4 "Something wrong in extracting numbers."


function order(words::String)::String
    @pipe words |> split |> sort(_, by=extract_number) |> join(_, " ")
end

@test order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"