function dblLinear(n) {
    let u = [1], i = 0, j = 0; //two pointer
    while (u.length < n + 1) {
        let newTerm = Math.min(2 * u[i] + 1, 3 * u[j] + 1);
        u.push(newTerm)
        if (newTerm === 2 * u[i] + 1) i++;
        if (newTerm === 3 * u[j] + 1) j++;
    }
    return u[n];
}

console.log(dblLinear(10));

module.exports = dblLinear;