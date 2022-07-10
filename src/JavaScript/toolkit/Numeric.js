/**
 * @module Numeric
 */


/** 在区间[a, b]上求方程 f(x)=0 的根
 * @param  {Function} f
 * @param  {Number} a 区间下限
 * @param  {Number} b 区间上限
 * @param  {Number} n 搜寻根的迭代次数
 * @return {Number} 方程的一个根
 */
const solveEquation = function (f, a = 0, b = 1, n = 10) {
  let low = a;
  let high = b;
  let result = '';
  let guess = undefined;
  let precise = false;

  if (f(low) * f(high) > 0) {
    result = 'Reshape interval to search a root.';
  } else if (f(low) * f(high) === 0) {
    guess = f(low) === 0 ? low : high;
    result = `There is a root of ${guess} between [${a}, ${b}].`;
  } else {
    guess = (low + high) / 2;
    for (let i = 0; i < n; i++) {
      if (f(guess) === 0) {
        precise = true;
        break;
      } else if (f(guess) * f(low) > 0) {
        console.log(`(${low}, ${high}) => ${guess}, too low`);
        low = guess;
      } else {
        console.log(`(${low}, ${high}) => ${guess}, too high`);
        high = guess;
      }
      guess = (low + high) / 2;
    }
    result = `There is a root ${precise ? 'of' : 'about'} ${guess} between [${a}, ${b}].`;
  }

  console.log(result);
  return guess;
};


module.exports = { solveEquation };