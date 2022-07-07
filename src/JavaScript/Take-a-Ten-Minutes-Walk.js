function isValidWalk(walk) {
  let nn = walk.filter(x => x === "n").length;
  let ns = walk.filter(x => x === "s").length;
  let nw = walk.filter(x => x === "w").length;
  let ne = walk.filter(x => x === "e").length;
  if (walk.length === 10 && nn === ns && nw === ne) return true;
  else return false;
}