using Statistics, Test


function get_outlier(sample::Vector{Int64}, cutoff::Real)::Vector{Int64}
    xs = sample
    x_bar = mean(sample)
    n = length(sample)
    sd = √(n \ sum((x - x_bar)^2 for x in xs))

    is_outlier(x::Real)::Bool = abs(x - x_bar) > cutoff * sd

    return filter(is_outlier, xs)
end

@test get_outlier([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100, 10000], 3) == [10000]


"""
去掉所有离群点后，求均值
"""
function clean_mean(sample::Vector{Int64}, cutoff::Real)::Float64
    while true
        outliers = get_outlier(sample, cutoff)
        isempty(outliers) && return mean(sample)
        # sample = sample[sample.∉outliers] # []选择器
        # sample = filter(x -> x ∉ outliers, sample)
        sample = filter(∉(outliers), sample)
    end
end

clean_mean([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100, 10000], 3)
