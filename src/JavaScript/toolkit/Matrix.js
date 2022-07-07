/**
 * @module Matrix
 */

const Vector = require("./Vector");

/**
 * 两个向量的哈达马积（对应项相乘）
 * @param {*} A 
 * @param {*} B 
 */
function hadamardProduct(A, B) {
  return Vector.zip(A, B).map(line => line[0] * line[1]);
}

// console.log(hadamardProduct([1, 2, 3], [4, 5, 6]));

module.exports = { hadamardProduct };