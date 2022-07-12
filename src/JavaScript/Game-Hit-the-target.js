const solution = function (mtrx) {
  for (let row of mtrx) {
    let scope = row.indexOf('>');
    let target = row.indexOf('x');
    if (target > -1 && scope > -1 && scope < target) return true;
  }
  return false;
};


console.log(solution([
  [' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' '],
  [' ', ' ', '>', ' ', 'x'],
  [' ', ' ', '', ' ', ' ']
]));
