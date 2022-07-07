/**
 * 修改/替换所有的单词，使用正则检测，避开标点符号
 * @param {String} str 
 * @returns 
 */
function pigIt(str) {
  return str.replace(/\w+/g, word => word.slice(1) + word[0] + 'ay');
}