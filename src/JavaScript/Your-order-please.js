

function order(words) {
  parseNumber = s => parseInt(s.match(/\d/g));

  return words.split(" ")
    .sort((a, b) => parseNumber(a) - parseNumber(b))
    .join(" ");
}

console.log(order("is2 Thi1s T4est 3a"));
