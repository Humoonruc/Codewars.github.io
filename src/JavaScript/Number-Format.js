
const numberFormat = function (number) {
    let absArray = Math.abs(number);
    let formatted = String(absArray)
        .split("").reverse().join("")
        .replace(/\d{3}/g, p => p + ",")
        .split("").reverse().join("");
    formatted = formatted[0] === "," ? formatted.slice(1) : formatted;
    return number >= 0 ? formatted : "-" + formatted;
};

// 另外可以
const numberFormat2 = function (number) {
    return new Intl.NumberFormat('en-US').format(number);
};


console.log(numberFormat(-111234000));
console.log(numberFormat2(-111234000));