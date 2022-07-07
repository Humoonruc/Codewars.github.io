using Statistics


function not_outlier(x, mean, std, cutoff)
  abs(x - mean) <= cutoff * std
end

function clean_mean(sample::Vector, cutoff)::Float64
  while true
    m = mean(sample)
    n = length(sample)
    sd = sqrt(sum((sample .- m) .^ 2) / n)
    sample_without_outlier = filter(x -> not_outlier(x, m, sd, cutoff), sample)

    if length(sample_without_outlier) == n
      return m
    else
      sample = sample_without_outlier
    end
  end
end

clean_mean([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100], 3)