/**
 * @module Arithmetic
 * @file frequently-used arithmetic functions
 */


const Vector = require("./Vector");


/**
 * 阶乘
 * @param {Number} n 阶数
 */
function factorial(n) {
  return Vector.naturalSequence(n).reduce((prod, k) => prod * k, 1);
}
// console.log(factorial(5));


/**
 * 除法取整
 * @param {Number} x 
 * @param {Number} y 
 * @returns {Integer}
 */
function div(x, y) {
  return Math.floor(x / y);
}
// console.log(div(8, 3));



module.exports =  { factorial, div };