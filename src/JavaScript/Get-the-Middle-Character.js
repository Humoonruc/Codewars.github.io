function getMiddle(s) {
  n = s.length;
  return n % 2 == 1 ? s[(n - 1) / 2] : s.substr(n / 2 - 1, 2);
}

module.exports = getMiddle;