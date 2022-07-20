function learn_kata(n)
    a = [1]
    j = [0]

    for k in 2:n
        u = a[k-1] + 1
        v = j[k-1] + 1
        push!(j, k - 1 - a[v])
        push!(a, k - 1 - j[u])
    end

    return a, j, sum(a), sum(j)
end




function john(n)
    learn_kata(n)[2]
end

function ann(n)
    learn_kata(n)[1]
end

function sum_john(n)
    learn_kata(n)[4]
end

function sum_ann(n)
    learn_kata(n)[3]
end