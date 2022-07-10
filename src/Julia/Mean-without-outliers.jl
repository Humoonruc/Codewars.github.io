using Statistics


function get_outlier(sample::Vector, cutoff)::Vector
  m = mean(sample)
  n = length(sample)
  sd = √((1 / n) * sum((sample .- m) .^ 2))

  filter(x -> abs(x - m) > cutoff * sd, sample)
end


function clean_mean(sample::Vector, cutoff)::Float64
  while true
    outliers = get_outlier(sample, cutoff)
    isempty(outliers) && return mean(sample)
    # sample = sample[sample.∉tuple(outliers)] # []选择器
    sample = filter(x -> x ∉ outliers, sample)
  end
end


clean_mean([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100], 3)