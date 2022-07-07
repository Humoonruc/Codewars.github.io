
/**
 * smiley face checker
 * @param {String} str 
 * @returns {Boolean} the parameter is a smiley face or not
 */
function isSmileyFace(str) {
  return /^[:;][-~]?[)D]/.test(str);
}

/**
 * smiley face counter
 * @param {Arrary} arr string array
 * @returns {integer} total number of smiling faces in the array
 */
function countSmileys(arr) {
  return arr.filter(isSmileyFace).length;
}

module.exports = countSmileys;
