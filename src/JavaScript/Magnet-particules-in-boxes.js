const Vector = require("./toolkit/Vector");
const naturalSequence = Vector.naturalSequence;
const crossing = Vector.crossing;
const sum = require("./toolkit/Statistics").sum;


function doubles(K, N) {
  const v = (k, n) => 1 / (k * Math.pow(n + 1, 2 * k));
  const crossIterator = crossing(naturalSequence(K), naturalSequence(N));
  return sum(crossIterator.map(paras => v(paras[0], paras[1])));
}

console.log(doubles(1, 10));
console.log(doubles(10, 1000));