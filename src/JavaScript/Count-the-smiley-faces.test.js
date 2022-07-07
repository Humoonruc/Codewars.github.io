const countSmileys = require('./Count-the-smiley-faces');
const { assert } = require('chai');

describe("Basic testing", function () {
  it("", () => {
    assert.strictEqual(countSmileys([]), 0);
    assert.strictEqual(countSmileys([':D', ':~)', ';~D', ':)']), 4);
    assert.strictEqual(countSmileys([':)', ':(', ':D', ':O', ':;']), 2);
    assert.strictEqual(countSmileys([';]', ':[', ';*', ':$', ';-D']), 1);
  });
});