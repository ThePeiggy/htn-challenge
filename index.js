var fs = require('fs');
var _ = require('lodash');

var pastValue = -1;
var tally = 1;
var fn = process.argv[2];
// date, market value, cash flow
_.forEach(fs.readFileSync(fn, 'utf8').split('\r\n'), function (line) {
	var curLine = _.map(line.split(','), function (item) {
		return parseInt(item);
	});

	if (curLine.length < 3) return;
	
	if (pastValue === -1) {
		pastValue = curLine[2];
	} else {
		tally *= (curLine[2] - curLine[1])/pastValue;
		pastValue = curLine[2];
	}
});

console.log(tally);