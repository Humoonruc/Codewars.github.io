library(tidyverse)
library(data.table)


###############################################################
## render solutions (.html)
renderHtml <- function(title) {
  fileName <- title %>% str_replace_all(" ", "-")

  meta <- c(
    "---",
    str_glue('title: "{title}"'),
    read_lines("./html/Rmd/config/meta.txt"),
    "\n"
  )
  kata <- meta


  if (file.exists(str_glue("./md/{fileName}.md"))) {
    kata <- c(
      kata,
      "### Description\n",
      read_lines(str_glue("./md/{fileName}.md")),
      "\n"
    )
  }


  kata <- c(kata, "### Solution\n")
  if (file.exists(str_glue("./src/R/{fileName}.R"))) {
    kata <- c(
      kata,
      "#### R",
      "```{r}",
      read_lines(str_glue("./src/R/{fileName}.R")),
      "```",
      "\n"
    )
  }
  if (file.exists(str_glue("./src/Julia/{fileName}.jl"))) {
    kata <- c(
      kata,
      "#### Julia",
      "```{julia}",
      read_lines(str_glue("./src/Julia/{fileName}.jl")),
      "```",
      "\n"
    )
  }
  if (file.exists(str_glue("./src/JavaScript/{fileName}.js"))) {
    js_code <- read_lines(str_glue("./src/JavaScript/{fileName}.js")) %>%
      str_replace("\\./toolkit", "\\.\\./\\.\\./src/JavaScript/toolkit")

    kata <- c(
      kata,
      "#### JavaScript\n",
      "```{node}",
      js_code,
      "```",
      "\n"
    )
  }
  if (file.exists(str_glue("./src/Python/{fileName}.py"))) {
    kata <- c(
      kata,
      "#### Python",
      "```{python}",
      read_lines(str_glue("./src/Python/{fileName}.py")),
      "```",
      "\n"
    )
  }


  readr::write_lines(kata, str_glue("./html/Rmd/{fileName}.Rmd"), sep = "\n")

  # outputPath <- str_glue("./Rmd/{fileName}.Rmd") %>%
  #   normalizePath() %>%
  #   dirname() %>%
  #   dirname() %>%
  #   str_c(str_glue("/html/{fileName}"))

  # print(outputPath)
  rmarkdown::render(str_glue("./html/Rmd/{fileName}.Rmd"), output_dir = "./html/", encoding = "UTF-8")
}


kata_table <- fread("./content.csv")
titles <- kata_table$Title
titles %>% walk(renderHtml) # 对每个 kata 生成 html
kata_table[, Solution := str_c("[HTML](./html/", str_replace_all(Title, " ", "-"), ".html)")]
fwrite(kata_table, "./content.csv")


###############################################################
## render index.html
rmarkdown::render("./html/Rmd/index.Rmd", output_dir = "./", encoding = "UTF-8")
# output_dir 这个参数是相对于脚本的路径，而非相对于 input 文件的路径
