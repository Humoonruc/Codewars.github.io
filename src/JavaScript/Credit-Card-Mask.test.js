// Credit-Card-Mask.test.js

const maskify = require('./Credit-Card-Mask');
const { assert } = require("chai");

describe("testing maskify", function () {
  it("should work for some examples", function () {
    assert.strictEqual(maskify('4556364607935616'), '############5616');
    assert.strictEqual(maskify('1'), '1');
    assert.strictEqual(maskify('11111'), '#1111');
  });
});