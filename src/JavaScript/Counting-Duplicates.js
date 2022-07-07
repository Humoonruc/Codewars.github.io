const Vector = require("./toolkit/Vector");


function duplicateCount(text) {

  const dict = Vector.counter(text.toLowerCase());
  return Object.values(dict).filter(x => x > 1).length;
}

console.log(duplicateCount("Indivisibilities"));