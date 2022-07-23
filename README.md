## Codewars 网站题目的解法

### 入口

GitHub Pages: https://humoonruc.github.io/Codewars.github.io/

### 项目说明


1. 用 Julia, R, JavaScript 三种语言（都对函数式编程有较好的支持）给出表格中每道题（Codewars 中称题目为 kata）的最优解法，在比较中更深刻地理解数据科学常用语法点的特性和适用场景
2. 本项目关注的重点不在算法，而在于数据科学的日常（算法复杂度较低的情形占了绝大多数）工作流程中，如何最大限度地保持代码逻辑的清晰
3. 总结最佳实践，如每种语言文件夹下的 `"tookit"` 子文件夹中汇总的自定义常用函数，今后调用起来非常方便


### 项目组织方式

#### 主页

`index.html`，主体是一个表格，包含以下字段：

- Title: 题目名称（超链接），可点击转到 www.codewars.com 上的对应页面
- Priority: 重要程度
- Difficulty: 难度
- Tag: 标签
- Grammar: 语法点
- Solution: 链接到一个新页面，其中有题目描述的详情和多种语言代码的实时运算结果


#### 主脚本

`render-bundle.jl`，功能如下：

1. 对于每道题，操作文件系统编辑出一个 `.Rmd` 文件，将题目的 Description 和各语言 Solutions 的代码整合起来
2. 调用 Shell，在其中用 `Rscript -e` 调用 rmarkdown 包的函数，将 `.Rmd` render 成 `.html`
3. 最后将这些 `.html` 的路径写入 `content.csv`
4. 读取 `content.csv` 后将其导出为可读性更强的表格，作为 `index.html` 的主体


### Tips

1. rmarkdown 调用其他语言
   1.  Julia, Python 受到原生支持
   2.  只要设置 JavaScript 引擎为 node，也可以实时运行。但 JavaScript 代码依赖外部脚本中的变量和函数时，使用 ES6 模块系统会报错，只能使用 CommonJS 模块系统
   3.  存在脚本互相调用时，注意修改相对路径
2. 将 `.Rmd` render 成 `.html` 时，注意相关设置
   1. css 文件夹、libs 文件夹都放在 /html 下而非 /Rmd 下，这样所有`.html`公用的资源只用保存一份，可以大大减小`.html`的体积（减小数十倍）
   2. config 文件夹放在顶层，便于修改