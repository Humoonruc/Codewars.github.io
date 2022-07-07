
convert2hex = integer =>
  Math.max(0, Math.min(255, integer)).toString(16).padStart(2, "0");

function rgb(r, g, b) {
  return [r, g, b].map(convert2hex).join("").toUpperCase();
}

console.log(rgb(-20, 275, 125));