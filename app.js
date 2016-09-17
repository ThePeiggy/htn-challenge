// Imports
var fs = require('fs');
var parse = require('csv-parse');

var readSnapshots = function(filename){
  fs.readFile(__dirname + "/" + filename, function(err, data){
    if (err) {
      console.log("An error occured while loading the file!");
      throw err;
    }
    parse(data.toString(), function(err, output){
      var subperiodReturns = [];
      // TODO: Cover when there's only 1 and 0 entry (EDGE CASE)
      var lastMarketVal = output[0][2];
      for (var i = 1; i < output.length; i++){
        var cashFlow = parseInt(output[i][1]);
        var marketValue = parseInt(output[i][2]);
        subperiodReturns.push((marketValue - cashFlow) / lastMarketVal - 1);
      }
      // Geometric Linking
      var result = 1;
      for (var subReturn in subperiodReturns){
        result *= (1 + subReturn);
      }
      return result;
    });
  });
}

readSnapshots("test/test-0.csv");
