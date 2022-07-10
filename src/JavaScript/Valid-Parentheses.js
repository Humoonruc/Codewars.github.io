
/**
 * 检测括号对匹配是否合法
 * @param {String} parens 包含小括号和其他各种字符的字符串
 * @returns {Boolean}
 */
function validParentheses(parens) {
  // 用整数 stack 类比 Stack 
  let stack = 0;

  for (c of parens.split("")) {
    if (c === '(') stack++;
    if (c === ')') stack--;
    if (stack < 0) return false;
  }

  return stack === 0;
}


console.log(validParentheses("()(())"));