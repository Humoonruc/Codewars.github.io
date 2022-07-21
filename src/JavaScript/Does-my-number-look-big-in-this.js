function narcissistic(value) {
    return String(value).split("")
        .map((x, i, arr) => x ** arr.length)
        .reduce((a, b) => a + b, 0)
        === value;
}

console.log(narcissistic(371));