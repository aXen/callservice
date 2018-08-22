// ning.jun16@zte.com.cn

function buildBodyMsg(argObject) {

	var zsmartDataObj = zsmartObj.zsmart.Data;

	for (key in zsmartDataObj) {
		zsmartDataObj[key] = argObject[key] || zsmartDataObj[key];
	}

	var xml = builder.buildObject(zsmartObj);

	debugLogger.debug(xml);

	return xml;
}

function callservice(argObject) {
	sendRequest(buildCallServiceOptions(), buildBodyMsg(argObject), function(res, msg, argObject) {
		// parse result...
		debugLogger.debug(msg);

		if (parseResult(msg)) {
			successLogger.info(argObject);
		} else {
			errorLogger.error(argObject);
		}

	}, argObject);
}

function parseResult(msg) {
	//console.log(typeof(msg));

	//return typeof(msg) === "string" && msg.indexOf("<RET_DESC>success</RET_DESC>") > 0;
	var ret = {};
	parseString(msg, function(err, result) {
		ret = result;
	});

	return (ret && ret.zsmart && ret.zsmart.Return && ret.zsmart.Return.$ && ret.zsmart.Return.$.Code == "0") === true;
}

function buildCallServiceOptions() {
	return {
		hostname: '10.180.8.12',
		port: 9081,
		path: '/cvbs/callservice.do',
		method: 'POST',
		headers: {
			'Content-Type': 'text/plain;charset=UTF-8',
			'Cookie': 'locale=en; UserName=ning; currMenuId=10461; JSESSIONID=0000-L24Fhb5B5aPGdIV4iPCADB:1a2ptba4f' // NOTE: need updating
		}
	};
}

function sendRequest(options, content, callback, callbackArgs) {
	var http = require('http');

	debugLogger.debug(content);

	var req = http.request(options, function(res) {
		debugLogger.debug('STATUS: ' + res.statusCode);
		debugLogger.debug('HEADERS: ' + JSON.stringify(res.headers));

		res.setEncoding('utf8');

		var retMsg = "";

		res.on('data', function(chunk) {
			//console.log('BODY: \n' + chunk);
			retMsg += chunk;
		});

		res.on('end', function() {
			if (callback) {
				callback(res, retMsg, callbackArgs);
			}
		});
	});

	req.on('error', function(e) {
		debugLogger.error('problem with request: ' + e.message);
		//console.log("=========== done failed! =========== ");

		if (callback) {
			callback({}, e, callbackArgs);
		}
	});

	// write data to request body
	req.write(content);

	req.end();
}

var argv = require('yargs')
  .option('s', {
    alias : 'service',
    demand: true,
    describe: 'service name',
    type: 'string'
  })
  .usage('Usage: node callservice.js [options]')
  .example('node callservice.js -s CHECK_IN_ARCHIVE_FAILED', 'call archive order service')
  .help('h')
  .alias('h', 'help')
  .epilog('ning.jun16@ztesoft.com.cn | copyright 2017')
  .argv;

var serviceName = argv.s;
//console.info(serviceName);

var serviceDataFileName = "./" + serviceName + ".data";
var serviceTmplFileName = serviceName + ".xml";

var log4js = require("log4js");
log4js.configure("./log4js.json");
var errorLogger = log4js.getLogger("error-file-appender");
var successLogger = log4js.getLogger("success-file-appender");
var debugLogger = log4js.getLogger("debug-file-appender");

var fs = require('fs');
var xmlTmpl = fs.readFileSync(serviceTmplFileName, 'utf-8');

var data = require(serviceDataFileName);

var xml2js = require('xml2js');
var parser = new xml2js.Parser({
	explicitArray: false
}); //xml -> json
var builder = new xml2js.Builder(); // JSON->xml
var parseString = parser.parseString;

// sync
parseString(xmlTmpl, function(err, result) {
	if (err) {
		debugLogger.error(err);
	}

	debugLogger.debug(result);

	zsmartObj = result;
});

console.info("Object List: " + data.objectList.length);

for (i = 0; i < data.objectList.length; i++) {
	callservice(data.objectList[i]);
	debugLogger.debug("=========== done! =========== ");
}