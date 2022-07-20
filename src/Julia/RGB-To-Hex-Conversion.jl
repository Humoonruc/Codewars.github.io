
function convert2hex(x::Int64)::String
    string(clamp(x, 0, 255); base=16, pad=2)
end
convert2hex(12)


function rgb(r::Int64, g::Int64, b::Int64)::String
    [r, g, b] .|> convert2hex |> join |> uppercase
    # string(convert2hex.([r, g, b])...) |> uppercase
end
rgb(-20, 275, 125)
