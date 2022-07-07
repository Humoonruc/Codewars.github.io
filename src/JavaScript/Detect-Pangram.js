
const letters = require("./toolkit/CharacterObject").letters;

function isPangram(string) {
  // const letters = [...Array(26)].map((_, i) => String.fromCharCode(i + 97));
  return letters.every(c => string.toLowerCase().includes(c));
}


console.log(isPangram("The quick, brown fox jumps over the lazy dog!"));