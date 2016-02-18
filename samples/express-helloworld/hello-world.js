var express = require('express')
var app = express();
app.use(express.static('public'));

app.get('/', function(req, res) {
    res.sendFile(__dirname+'/index.html');
});

app.listen(2222);
console.log('Express server running at http://127.0.0.1:2222/');