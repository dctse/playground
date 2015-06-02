process.env.port = '3001';
process.env.NODE_ENV='test'

require("coffee-script/register");
require(__dirname + '/assert-extra');