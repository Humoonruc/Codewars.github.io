
function reverseDigits(n) {
    return parseInt(String(n).split("").reverse().join(""));
}


/**
 * 一个数如果不是 palindrome（回文结构），就令其加上自己各位数字反向排列组成的数
 * 经过多少次这样的变换，才会成为 palindrome
 * @param {Integer} n 
 * @returns {Integer}
 */
const palindromeChainLength = function (n) {
    let k = 0;

    while (reverseDigits(n) !== n) {
        n += reverseDigits(n);
        k++;
    }

    return k;
};

console.log(palindromeChainLength(87));

