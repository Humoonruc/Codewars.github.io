

const dict = new Map()
  .set('i', ({ n: k, output: arr }) => ({ n: k + 1, output: arr }))
  .set('d', ({ n: k, output: arr }) => ({ n: k - 1, output: arr }))
  .set('s', ({ n: k, output: arr }) => ({ n: k ** 2, output: arr }))
  .set('o', ({ n: k, output: arr }) => ({ n: k, output: arr.concat(k) }));


function parse(data) {
  let result = data.split("")
    .filter(c => "idso".includes(c))
    .reduce(
      callBack = (obj, c) => dict.get(c)(obj),
      initialValue = { n: 0, output: [] }
    );

  return result.output;
}


console.log(parse("iiisxxxdoso")); // [8, 64]