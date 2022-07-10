
function convert2hex(x)
  string(clamp(x, 0, 255); base=16, pad=2)
end
convert2hex(12)


function rgb(r, g, b)
  [r, g, b] .|> convert2hex |> join |> uppercase
  # string(convert2hex.([r, g, b])...) |> uppercase
end
rgb(-20, 275, 125)
