/**
 * @module CharacterObject
 */


// 26 个英文字母的数组
const letters = [...Array(26)].map((_, i) => String.fromCharCode(i + 97));
const LETTERS = [...Array(26)].map((_, i) => String.fromCharCode(i + 65));


module.exports = { letters, LETTERS };

