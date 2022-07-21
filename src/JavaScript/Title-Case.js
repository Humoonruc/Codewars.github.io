/**
 * @module Title-Case
 */


const toTitleCase = word =>
    word.split("")
        .map((char, i) => i === 0 ? char.toUpperCase() : char.toLowerCase())
        .join("");

console.log(toTitleCase("tHE"));



function titleCase(sentence, minorWords = "") {
    let lowerWords = sentence.split(" ").map(x => x.toLowerCase());
    let lowerMinorWords = minorWords.split(" ").map(x => x.toLowerCase());

    ifKeepLower = (word, index) => index > 0 && lowerMinorWords.indexOf(word) > -1;
    dealWord = (word, index) => ifKeepLower(word, index) ? word.toLowerCase() : toTitleCase(word);

    return lowerWords.map(dealWord).join(" ");
};

console.log(titleCase('THE WIND IN THE WILLOWS', 'The In'));