/**
 * @module Unique-In-Order
 */

/**
 * 只保留与前一项不同的项，组成新向量
 * @param {Iterable} iterable 
 * @returns {Iterable}
 */
function uniqueInOrder(iterable) {
    return [...iterable].filter((a, i) => a !== iterable[i - 1]);
    // index为-1时，返回undefined
};

console.log(uniqueInOrder('AAAABBBCCDAABBB'));