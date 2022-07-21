/**
 * 去掉已出现次数大于n的字符
 * @param {Array} arr 
 * @param {Integer} n 
 * @returns 
 */
const deleteNth = (arr, n) => {
    let map = new Map();

    return arr.filter(key => {
        let value = map.get(key) || 0; // ||左边的表达式转换成Bool为false，返回||右边的表达式
        map.set(key, value + 1);
        return map.get(key) <= n;
    });
};


console.log(deleteNth([1, 1, 3, 3, 7, 2, 2, 2, 2], 2)); // [1, 1, 3, 3, 7, 2, 2]