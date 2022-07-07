/**
 * @module Vector
 */


/**
 * 自然数序列构造器，如 0:n 或 1:n
 * @param {Number} n size of array 
 * @param {Number} start start number 
 * @returns
 */
function naturalSequence(n, start = 1) {
  return [...Array(n)].map((_, i) => i + start);
}
// console.log(naturalSequence(5));
// console.log(naturalSequence(5, 0));


/**
 * 数组去重
 * @param {Array} arr 
 */
function unique(arr) {
  return [...new Set(arr)];
}
// console.log(unique([1, 1, 2, 3, 4, 4, 4]));



/**
 * 对数组进行频数统计，元素-频数的键值对组合成一个对象返回
 * @param {Array} arr 
 */
function counter(arr) {
  const dict = {};
  for (i = 0; i < arr.length; i++) {
    if (arr[i] in dict) {
      dict[arr[i]]++;
    } else {
      dict[arr[i]] = 1;
    }
  }
  return dict;
}
// console.log(counter([1, 1, 2, 3, 4, 4, 4]));



/**
 * 两个以上数组对应项的组合
 * @param {Array} arr1 
 * @param {Array} arr2 
 * @param  {...Array} rest 可能存在的额外一些数组 
 * @returns {Array<Array>} 返回嵌套数组
 */
function zip(arr1, arr2, ...rest) {
  const n = arr1.length;
  const result = [];
  for (let i = 0; i < n; i++) {
    const line = [];
    line.push(arr1[i], arr2[i]);
    for (let arr of rest) {
      line.push(arr[i]);
    }
    result.push(line);
  }
  return result;
}
// console.log(zip([1, 2, 3, 4], [5, 6, 7, 8]));


/**
 * 两个数组的交叉遍历
 * @param {Array} arr1 
 * @param {Array} arr2 
 * @returns {Array<Array>}
 */
function crossing(arr1, arr2) {
  const line = [];
  for (let i = 0; i < arr1.length; i++) {
    for (let j = 0; j < arr2.length; j++) {
      line.push([arr1[i], arr2[j]]);
    }
  }
  return line;
}
// console.log(crossing([1, 2, 3], [1, 2]));



module.exports = { naturalSequence, unique, counter, zip, crossing };