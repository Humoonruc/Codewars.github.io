
const closureFactory = x => (f => f === undefined ? x : f(x));

const [zero, one, two, three, four, five, six, seven, eight, nine] =
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map(closureFactory);


const plus = k => (x => x + k);
const minus = k => (x => x - k);
const times = k => (x => x * k);
const dividedBy = k => (x => (x - x % k) / k);

console.log(eight(minus(three())));
console.log(seven(times(five())));