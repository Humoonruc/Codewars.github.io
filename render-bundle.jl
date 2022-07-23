using DataFrames, CSV
using Pipe


###############
# config
###############
const csv_path = "./content.csv"
const meta_path = "./config/meta.txt"
const output_yaml_path = "../config/_output.yml"
const index_path = "./Rmd/index.Rmd"
const ext_dict = Dict(
    "md" => ("markdown", "markdown"),
    "jl" => ("Julia", "julia"),
    "R" => ("R", "r"),
    "js" => ("JavaScript", "node"),
    "py" => ("Python", "python")
)


###############
# function
###############
function getKataNames(csv_path::String)::Vector{String}
    df = CSV.read(csv_path, DataFrame)
    df[!, :Title]
end


"""
    add_text(txt, src_name, ext) -> new_txt
# Arguments
- `file_name`: 将题目名称中的空格替换为`-`后的文件名
- `ext`: 文件的扩展名
"""
function add_text(txt::String, file_name::String, ext::String)::String
    src_path = "./src/$(ext_dict[ext][1])/$file_name.$ext"

    if ext == "md" && ispath(src_path)
        txt *= read(src_path, String) # read() 读取，结尾无 \n
    elseif ispath(src_path)
        prefix = "\n#### $(ext_dict[ext][1])\n\n```{$(ext_dict[ext][2])}\n"
        suffix = "\n```\n"
        code = read(src_path, String)

        if ext == "R"
            code = replace(code, "./src/R/toolkit" => "../src/R/toolkit")
        elseif ext == "jl" || ext == "js"
            code = replace(code, "./toolkit" => "../src/$(ext_dict[ext][1])/toolkit")
        end

        txt *= prefix * code * suffix
    end

    return txt
end


function renderRmd(kata_name::String)
    file_name = replace(kata_name, " " => "-")
    rmd_path = "./Rmd/$file_name.Rmd"

    @pipe read(meta_path, String) |>
          replace(_, "{title}" => file_name) |>
          add_text(_, file_name, "md") |>
          (s -> s * "\n\n### Solutions\n\n") |>
          add_text(_, file_name, "jl") |>
          add_text(_, file_name, "R") |>
          add_text(_, file_name, "js") |>
          add_text(_, file_name, "py") |>
          write(rmd_path, _)

    return rmd_path
end


function renderHtml(rmd_path::String)
    output_dir = rmd_path == index_path ? "./" : "./html/"
    render_rmd = "rmarkdown::render(input = '$rmd_path', output_dir = '$output_dir', output_yaml = '$output_yaml_path')"
    cmd = `Rscript -e $render_rmd` # -e 不能少
    # @show render_rmd cmd
    run(cmd)
end


"""
    addLink(title) -> markdown_link
接收kata name，返回链接到 html 文件的 md 格式的超链接`[]()`
"""
function addLink(title)
    "[HTML](./html/$(replace(title, " " => "-")).html)"
end


function updateCSV(csv_path)
    df = CSV.read(csv_path, DataFrame)

    @pipe df |>
          transform(_, :Title => ByRow(addLink) => :Solution) |>
          sort!(_, [:Tag, "Difficulty(kyu)"])

    CSV.write(csv_path, df)
end



###############
# main
###############
rmd_files = getKataNames("./content.csv") .|> renderRmd
renderHtml.(rmd_files)
updateCSV(csv_path)
renderHtml(index_path)