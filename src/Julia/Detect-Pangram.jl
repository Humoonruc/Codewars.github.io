function is_pangram(string)
  ('a':'z' .∈ lowercase(string)) |> all
end

using Test
@test is_pangram("The quick, brown fox jumps over the lazy dog!") == true