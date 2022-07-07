function anagrams(word, words) {
  rearrange = string => string.split('').sort().join('');
  return words.filter(w => rearrange(w) === rearrange(word));
}

console.log(anagrams("abba", ["aabb", "abcd", "bbaa", "dada"]));