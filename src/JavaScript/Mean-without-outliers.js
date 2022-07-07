const Statistics = require("./toolkit/Statistics")
const sum = Statistics.sum;
const mean = Statistics.mean;


function notOutlier(x, mean, std, cutoff) {
  return Math.abs(x - mean) <= cutoff * std;
}

function cleanMean(sample, cutoff) {
  let m, n, std;
  let sample_without_outlier = [];
  while (true) {
    m = mean(sample);
    n = sample.length;
    sd = Math.sqrt(sum(sample.map(x => Math.pow(x - m, 2))) / n);
    sample_without_outlier = sample.filter(x => notOutlier(x, m, sd, cutoff));

    if (sample_without_outlier.length === n) {
      return m;
    } else {
      sample = sample_without_outlier;
    }
  }
}


console.log(cleanMean([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100], 3));