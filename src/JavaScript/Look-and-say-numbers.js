/**
 * @module Look-and-say-numbers
 */


function countString(s) {
    return s.replace(/(.)\1*/g, (match, p1) => match.length + p1);
}

console.log(countString('112223'));


function lookAndSay(s, len) {
    // 利用了变量重新赋值语句有返回值，以及匿名函数可以修改外部变量的特性
    return [...Array(len)].map(() => s = countString(s));
}

console.log(lookAndSay('1', 5));