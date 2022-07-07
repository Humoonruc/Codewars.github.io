// Credit-Card-Mask.js

function maskify(cc) {
  // 解法一：按长度构造
  // return '#'.repeat(Math.max(cc.length - 4, 0)) + cc.slice(-4);

  // 解法二：`pad*()` 填充
  // return cc.slice(-4).padStart(cc.length, '#');

  // 解法三：替换
  // return cc.slice(0, -4).replace(/./g, '#') + cc.slice(-4);

  // 解法四：完全的正则
  return cc.replace(/.(?=.{4})/g, '#');
}
