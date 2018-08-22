var fs = require('fs'),
    xml2js = require('xml2js');
    
var parser = new xml2js.Parser({
	explicitArray: false
});
fs.readFile(__dirname + '/CHECK_IN_ARCHIVE_FAILED.xml', function(err, data) {
    parser.parseString(data, function (err, result) {
        //console.log(result);
        console.log(JSON.stringify(result));
        console.log('Done');
    });
});