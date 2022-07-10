/**
 * @module sample
 * @file 抽样
 */


/** [min, max] 上自然数的随机抽样
 * @param  {} scale
 */
const sample = function (min, max) {
  return [...Array(max - min + 1)]
    .map((d, i) => i + min)
    .sort((a, b) => Math.random() - 0.5);
};

// console.log(sample(11, 20));