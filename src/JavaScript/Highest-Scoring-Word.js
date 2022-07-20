/**
 * @module Highest-Scoring-Word
 */

const sum = require("./toolkit/Statistics").sum;

function get_score(word) {
  return sum(word.split('').map(c => c.charCodeAt() - 'a'.charCodeAt() + 1));
}

function high(x) {
  const words = x.split(' ');
  const values = words.map(get_score);
  return words[values.indexOf(Math.max(...values))];
}

console.log(high('what time are we climbing up the volcano'));