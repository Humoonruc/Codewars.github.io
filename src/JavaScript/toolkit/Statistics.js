/**
 * @module Statistics
 */


/**
 * 数组所有元素之和
 * @param {Array<Number>} arr 
 */
function sum(arr) {
  return arr.reduce((sum, n) => sum + n, 0);
}

// console.log(sum([1, 2, 3, 4]));


/**
 * 算数平均数
 * @param {Array<Number>} arr 
 */
function mean(arr) {
  return sum(arr) / arr.length;
}
// console.log(mean([1, 2, 3, 4]));


/**
 * 中位数
 * @param {Array<Number>} arr 
 */
function median(arr) {
  n = arr.length;
  sorted = arr.sort();
  return n % 2 === 0 ? (sorted[n / 2 - 1] + sorted[n / 2]) / 2 : sorted[(n - 1) / 2];
}
// console.log(median([1, 3, 2, 4]));
// console.log(median([1, 3, 2, 4, 5]));


module.exports = { sum, mean, median };