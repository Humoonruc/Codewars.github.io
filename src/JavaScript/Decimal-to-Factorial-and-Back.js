
const naturalSequence = require("./toolkit/Vector").naturalSequence;
const factorial = require("./toolkit/Arithmetic").factorial;
const hadamardProduct = require("./toolkit/Matrix").hadamardProduct;
const sum = require("./toolkit/Statistics").sum;


// 字符串本身就是 iterator, 可以用索引 [] 访问
const code = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const encode = new Map, decode = new Map;
for (let i = 0; i <= 35; i++) {
  encode.set(i, code[i]);
  decode.set(code[i], i);
}


function dec2FactString(nb) {
  // 寻找最大的基
  let maxBase = 1;
  while (factorial(maxBase + 1) <= nb) {
    maxBase++;
  }

  // 对应这组基的系数向量
  const factors = [];
  for (let i = maxBase; i >= 0; i--) {
    char = encode.get(Math.floor(nb / factorial(i)));
    factors.push(char);
    nb %= factorial(i);
  }

  return factors.join('');
}

console.log(dec2FactString(463));


function factString2Dec(string) {
  const factors = string.split('').reverse().map(char => decode.get(char));
  const bases = naturalSequence(string.length, start = 0).map(factorial);
  return sum(hadamardProduct(factors, bases));
}

console.log(factString2Dec("341010"));