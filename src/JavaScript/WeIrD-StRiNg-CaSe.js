/**
 * @module WeIrD-StRiNg-CaSe
 */


function upperEven(str) {
    return str.split("")
        .map((x, i) => i % 2 ? x.toLowerCase() : x.toUpperCase())
        .join("");
}

console.log(upperEven("This"));

function toWeirdCase(string) {
    return string.split(" ").map(upperEven).join(" ");
}

console.log(toWeirdCase('This is a test'));