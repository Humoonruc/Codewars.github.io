

function solution(str) {
    // 解法一：遍历字符的 index
    // const n = str.length;
    // let array = [];
    // if (n % 2 === 1) {
    //   str += '_';
    // }
    // for (let i = 0; i < n / 2; i++) {
    //   array.push(str.slice(2 * i, 2 * i + 2));
    // }
    // return array;

    // 解法二：string.match() 正则匹配
    // str 为 '' 时，匹配失败返回 null，对应的布尔值为 flase
    // 短路逻辑，返回第一个布尔值为 true 的初始值，即[]
    return (str + "_").match(/.{2}/g) || [];
    // 等价于
    // if (str === '') {
    //   return [];
    // } else {
    //   return (str + "_").match(/.{2}/g);
    // }
}


module.exports = solution;