
function deleteNth(arr::Vector, n::Int64)

    # 第一种解法：filter()
    # d = Dict{Any,Int64}()

    # function select(key)
    #     value = get(d, key, 0)
    #     d[key] = value + 1
    #     return value < n
    # end

    # return filter(select, arr)

    # 第二种解法：循环，相当于 foreach()
    d = Dict{Any,Int64}()
    output = []

    for key ∈ arr
        value = get(d, key, 0)
        if value < n
            push!(output, key)
            d[key] = value + 1
        end
    end

    return output
end


@test deleteNth([20, 37, 20, 21], 1) == [20, 37, 21]
@test deleteNth([1, 1, 3, 3, 7, 2, 2, 2, 2], 3) == [1, 1, 3, 3, 7, 2, 2, 2]