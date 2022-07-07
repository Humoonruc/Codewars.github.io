const counter = require("./toolkit/Vector").counter;

/**
 * 重复字符编码器
 * @param {String} word 
 */
function duplicateEncode(word) {
  const lowerWord = word.toLowerCase();
  const dict = counter(lowerWord);
  return lowerWord.split("").map(c => dict[c] === 1 ? "(" : ")").join("");
}

console.log(duplicateEncode("Success"));