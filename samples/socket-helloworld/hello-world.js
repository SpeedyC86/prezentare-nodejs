// Setup basic express server
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var port = process.env.PORT || 2222;

server.listen(port, function () {
    console.log('Server listening at port %d', port);
});

// Routing
app.get('/', function(req, res) {
    res.sendFile(__dirname+'/public/index.html');
});
app.use(express.static(__dirname + '/public'));


io.on("connection", function (client) {
// register listener for connected

    client.on("message", function (msg) {//register listener for receiving a message
        client.json.send({msg: msg}); // Sends a message to the client
        client.broadcast.json.send({msg: msg}); // Sends a message to all other clients.
    });

    client.on("disconnect", function () {
    }); // register listener for disconnected
});
