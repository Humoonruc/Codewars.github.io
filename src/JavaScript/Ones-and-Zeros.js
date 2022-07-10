const sum = require("./toolkit/Statistics").sum;


const binaryArrayToNumber = arr => {
  // 向量化操作
  // return sum(arr.reverse().map((x, i) => x * Math.pow(2, i)));

  // 解析2进制字符串为10进制整数
  return parseInt(arr.join(''), 2);
};


console.log(binaryArrayToNumber([0, 1, 1, 0]) == 6);