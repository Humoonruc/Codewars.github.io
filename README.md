### 项目组织方式

一个主脚本文件 `render.R`，功能如下：

1. 每个 kata 导出一个 html，包含题目的 description 和各语言 solutions 的脚本代码，在 Rmd 中组织起来，并自动 render html
   1. js 代码依赖外部脚本中的变量和函数时，无法在 Rmd 中运行。因为在 Rmd 的 js 代码块不被认为是一个 module，使用 `import` 会报错
   2. R, julia, Python 代码在 Rmd 中均可运行、实时显示结果

2. 读取 content.csv 后将其导出为可读性更强的表格，同样用一个 Rmd 文件来完成
3. `render.R` 负责操作文件系统、编写 Rmd 文件的代码，并以命令的方式 render .html 文件

> csv 可以用在线工具转为 markdown 表格，然后导出漂亮的 html



项目入口在 `index.html`