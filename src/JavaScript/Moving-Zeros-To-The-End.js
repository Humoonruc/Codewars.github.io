function moveZeros(arr) {
    // ...将数组中的所有元素展开，然后才是元素的串联，而非两个数组元素组成嵌套数组
    return [...arr.filter(x => x !== 0), ...arr.filter(x => x === 0)];
}

console.log(moveZeros([false, 1, 0, 1, 2, 0, 1, 3, "a"]));

module.exports = moveZeros;
