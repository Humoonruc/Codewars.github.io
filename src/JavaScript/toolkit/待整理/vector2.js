/**
 * @module vector
 * @file 向量
 */


/** 生成自然数序列 sequence
 * @param  {Number} from
 * @param  {Number} to
 * @param  {Number} by
 * @param  {Number} size
 */
const seq = function (from = 1, to = 10, by = 1, size = null) {
  if (size === null) {
    size = (to - from) / by + 1;
  } else if (by === null) {
    by = (to - from) / (size - 1);
  } else if (from === null) {
    from = to - by * (size - 1);
  }

  const arr = [...new Array(size).keys()]
    .map(d => d * by + from);
  return arr;
};

console.log(seq(5, 15));
console.log(seq(1, 11, 2));
console.log(seq(3, 10, null, 15));
//=> [3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
console.log(seq(1, null, 2, 10));
console.log(seq(null, 30, 2, 10));
//=> [12, 14, 16, 18, 20, 22, 24, 26, 28, 30]

(5 - 5 % 2)/2

/** 重复一个序列若干次
 * @param  {Array} seq
 * @param  {Number} times=1
 * @param  {Number} each=1
 */
const rep = function (seq, times = 1, each = 1) {
  const result = [];
  for (let t = 0; t < times; t++) {
    for (let i = 0; i < seq.length; i++) {
      for (let j = 0; j < each; j++) {
        result.push(seq[i]);
      }
    }
  }
  return result;
};

console.log(rep(seq(1, 3), 2, 3));
console.log(rep(seq(1, 3), 2));
console.log(rep(seq(1, 3), undefined, 3));