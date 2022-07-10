/**
 * @module factors
 * @file 与因数分解有关
 */


/** 
 * 分解所有因数
 * @param  {Number} num
 * @return {Array}
 */
const getFactors = function (num) {
  return [...Array(Math.floor(num / 2))]
    .map((d, i) => i + 1)
    .filter(d => d >= 2 && num % d === 0);
};

console.log(getFactors(36));


/** 
 * 求两个数的最大公因数(greatest common factor, GCF)
 * @param  {Number} a
 * @param  {Number} b
 */
const getGCF = function (a, b) {
  factorsA = getFactors(a);
  factorsB = getFactors(b);
  const commonFactors = factorsA.filter(d => factorsB.indexOf(d) >= 0).reverse();
  return commonFactors.length > 0 ? commonFactors[0] : 'None';
};

console.log(getGCF(150, 138));


module.exports = { getFactors, getGCF };

