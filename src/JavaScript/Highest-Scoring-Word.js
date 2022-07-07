
const sum = require("./toolkit/Statistics").sum;

function high(x) {
  const words = x.split(' ');
  const values = words.map(word => sum(word.split('').map(char => char.charCodeAt() - 96)));
  return words[values.indexOf(Math.max(...values))];
}
console.log(high('what time are we climbing up the volcano'));

module.exports = high;
