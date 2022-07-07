/**
 * 
 * @param {Number} n 
 * @returns {Number}
 */
function descendingOrder(n) {
  return parseInt(String(n).split('').sort().reverse().join(''));
}


// 同理有
function squareDigits(n) {
  return parseInt(String(n).split('').map(x => x ** 2).join(''));
}
console.log(squareDigits(9812) === 816414);


module.exports = descendingOrder;
