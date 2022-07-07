## 项目组织方式

### GitHub Pages 主页

`index.html`

### 主脚本

`render.R`，功能如下：

1. 对于每个 kata，操作文件系统编辑一个 Rmd 文件，将题目的 description 和各语言 solution 的脚本代码整合起来，并自动 render 成 html，最后将这些 html 的路径写入 `content.csv`
   1. R, Julia, Python 代码在 Rmd 中均可实时运行并显示结果
   2. 只要设置 JavaScript 引擎为 node，也可以实时运行。但 JavaScript 代码依赖外部脚本中的变量和函数时，ES6 模块系统会报错，只能使用 CommonJS 模块系统，且注意修改相对路径
2. 读取 content.csv 后将其导出为可读性更强的表格，作为 `index.html` 的主体


