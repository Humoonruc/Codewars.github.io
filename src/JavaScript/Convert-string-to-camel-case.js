function toCamelCase(str) {
  // return str.replace(/[-_]\w/g, w => w[1].toUpperCase());

  // 用()分组，匹配结果返回array，第一个元素永远都是完全匹配结果，第二个元素开始是括号中pattern匹配的局部
  return str.replace(/[-_](.)/g, (_, c) => c.toUpperCase());
}