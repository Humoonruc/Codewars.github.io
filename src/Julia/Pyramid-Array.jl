function pyramid(n)
  # 等价的三种写法
  # [ones(Int, k) for k ∈ 1:n]
  # [fill(1, k) for k ∈ 1:n]
  [repeat([1], k) for k ∈ 1:n]
end

using Test
@test pyramid(3) == [[1], [1, 1], [1, 1, 1]]