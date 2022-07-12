/**
 * @module Pyramid-Array
 * @file JS 中的 repeat 可以考虑 Array(n).fill()
 */

const repeat = require("./toolkit/Vector").repeat;

function pyramid(n) {
  return [...Array(n)].map((_, i) => repeat([1], i + 1));
}

console.log(pyramid(3));