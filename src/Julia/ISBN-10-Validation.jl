# ISBN-10-Validation.jl


"""
解析每一位数字，'X'解析为10
"""
function parse_isbn(isbn::String)::Vector{Int8}
    isbn |> collect .|> x -> isdigit(x) ? parse(Int8, x) : 10
end


function isvalidISBN10(isbn::String)::Bool
    form_check = occursin(r"^\d{9}(\d|X)$", isbn)
    !form_check && return false

    arithmetic_check = sum(parse_isbn(isbn) .* (1:10)) % 11 == 0
    return arithmetic_check
end


isvalidISBN10("1293")
isvalidISBN10("1112223339")
isvalidISBN10("1234512345")
isvalidISBN10("X123456788")