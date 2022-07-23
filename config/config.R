# import modules
library(tidyverse)
library(bruceR)
library(magrittr)
library(kableExtra) # 表格美化
library(plotly) # 绘图
library(htmlwidgets)
library(downloadthis) # 提供资源下载的html部件
library(zeallot) # 解构赋值
library(ivreg) # 做 2SLS regression 很方便
library(numDeriv) # Package for computing f'(x)
library(rootSolve) # 求解非线性方程（组）和最优化
library(testthat) # 单元测试包


# .Rmd 配置参数
config <- list(
    width = 80,
    fig.width = 6,
    fig.asp = 0.618,
    out.width = "90%",
    fig.align = "center",
    fig.path = "../img/",
    fig.show = "asis",
    warn = 1, # 强制在警告产生的同时输出警告信息，然后才输出运行结果. warn = 2 会将警告视为错误，中止程序
    warning = TRUE,
    message = TRUE,
    echo = TRUE, # 是否显示代码
    eval = TRUE, # 是否运行代码块
    tidy = T, # 代码排版
    comment = "#>", # 每行输出的前缀，为了方便复制粘贴时不会污染代码
    collapse = F, # 代码与结果是否显示在同一代码块，选 FALSE 可避免打印图形后，同一代码块中后面的行被落在块外
    cache = T, # 代码块运行结果缓存
    cache.comments = T,
    autodep = T # 自动获得模块间依赖，cache 用
)


# 自定义表格样式
prettify <- function(table, ...) {
    align_vector <- rep("c", ncol(table))

    kable(table, "html", align = align_vector, ...) %>%
        kable_styling(
            bootstrap_options = c(
                "striped", # 明暗条纹
                "hover", # 鼠标划过高亮
                "condensed", # 紧凑行高
                "responsive" # 响应屏幕宽度
            ),
            # font_size = 14,
            full_width = T
        )
}