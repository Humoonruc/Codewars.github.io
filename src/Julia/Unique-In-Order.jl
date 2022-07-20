# Unique-In-Order.jl

"""
删除与前一个元素相同的元素
"""
function unique_in_order(arr)::Vector
    [x for (i, x) ∈ enumerate(arr) if (i == 1 || x ≠ arr[i-1])]
end


unique_in_order([1, 2, 2, 3, 3, 3, 2])
unique_in_order("aabbccaa")

