const high = require("./Highest-Scoring-Word");
const chai = require("chai");
const assert = chai.assert;
chai.config.truncateThreshold = 0;

describe("Basic tests", () => {
  it("Testing for fixed tests", () => {
    assert.strictEqual(high('man i need a taxi up to ubud'), 'taxi');
    assert.strictEqual(high('what time are we climbing up the volcano'), 'volcano');
    assert.strictEqual(high('take me to semynak'), 'semynak');
    assert.strictEqual(high('massage yes massage yes massage'), 'massage');
    assert.strictEqual(high('take two bintang and a dance please'), 'bintang');
    assert.strictEqual(high('aa b'), 'aa');
    assert.strictEqual(high('b aa'), 'b');
    assert.strictEqual(high('bb d'), 'bb');
    assert.strictEqual(high('d bb'), 'd');
    assert.strictEqual(high('aaa b'), 'aaa');
  });

  it("Random tests", () => {
    const randint = (a, b) => ~~(Math.random() * (b - a + 1)) + a;
    function myhigh(x) {
      x = x.toLowerCase().split(' ');
      let tot = 0, lead = 0, lead2 = 0, letter = { 'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8, 'i': 9, 'j': 10, 'k': 11, 'l': 12, 'm': 13, 'n': 14, 'o': 15, 'p': 16, 'q': 17, 'r': 18, 's': 19, 't': 20, 'u': 21, 'v': 22, 'w': 23, 'x': 24, 'y': 25, 'z': 26 };
      for (let i = 0; i < x.length; i++) {
        x[i] = x[i].split('');
        for (let j = 0; j < x[i].length; j++) {
          tot += letter[x[i][j]];
        }
        //console.log(tot);
        if (tot > lead) lead = tot, lead2 = i;
        tot = 0;
      }
      return x[lead2].join('');
    }

    let names = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];

    for (let i = 0; i < 100; i++) {
      let x = [], b = [], a = [], c = [], d = [], e = [], f = [], g = [], h = [], len = randint(1, 31);

      for (let k = 0; k < len; k++) {
        a.push(names[randint(0, names.length - 1)]);
        b.push(names[randint(0, names.length - 1)]);
        c.push(names[randint(0, names.length - 1)]);
        d.push(names[randint(0, names.length - 1)]);
        e.push(names[randint(0, names.length - 1)]);
        f.push(names[randint(0, names.length - 1)]);
        g.push(names[randint(0, names.length - 1)]);
        h.push(names[randint(0, names.length - 1)]);
      }
      x.push(a.join(''), b.join(''), c.join(''), d.join(''));
      x = x.join(' ');
      assert.strictEqual(high(x), myhigh(x), `Testing for ${JSON.stringify(x)}`);
    }
  });
});