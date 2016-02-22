# Nodejs Presentation

[logo]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/nodejs-logo.png "NodeJS"
[iot]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/iot.png "Interest over time"
[non-blocking-io]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/nodejs.png "Single threaded non-blocking I/O"
[blocking-io]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/apache.png "Multi threaded blocking I/O"
[websocket]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/socket.jpg "Websocket"
[ajax_polling]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/ajax_polling.jpg "Ajax polling"
[jsonp]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/jsonp.jpg "Jsonp polling"

![alt text][logo]


##What is NodeJS?

[nodejs.org](https://nodejs.org)

* "Node.js is an open source, cross-platform runtime environment for server-side and networking applications". - [Wikipedia](https://en.wikipedia.org/wiki/Node.js)
* a platform for building JavaScript applications optimized for performing high speed input/output operations 
* a platform which contains a JavaScript execution engine (that engine is Google's Chrome V8 engine)


##NodeJS's early beginnings 

                   _.~._
                 ,~'.~@~.`~.
                / : _..._ : \
               { :,"''))`".: }
                `C) 9 _ 9 (-'.._,-"7o-.__
                 (  )(@)(  )      /o     `.
                  `-.___.-'       `-._   / \
                     \ /              `-'  ;`-._,-.
                      y    ,'          `---t.,-.   \_____
                    ,'    /---.__\         _(   \--------'
                  _,\   ,'        `-.__.--'  `.  \_____
               '///,-`-'                       `-------'

* NodeJS was created in 2009 by Ryan Dahl, it was first published for Linux
* debuted at the November 2009 European JSConf
* the continued development was done by Joyent the company where Dahl worked


##NodeJS's popularity

![alt text][iot]
[https://goo.gl/NZGYl1](https://goo.gl/NZGYl1)

##Who fell in node with it?

1. Backed by the Node.js Foundation
2. Got support from Google, Microsoft, IBM and legions of majority fat and single open source developers
3. Used by:
  * Google   
  * Microsoft  
  * IBM   
  * LinkedIn  
  * Mozilla  
  * PayPay  
  * Uber   
  * and so many more, a true eye-catcher

##Really now... why NodeJS?

* crazy fast (core in C++ on top of V8 Engine)
* Asynchronous I/O Framework
* Single threaded (but that's ok)
* One language to rule them all (ECMAScript)
* Swiss army knife for network
* huge package ecosystem (npm)
 
##I like NodeJS, but...

* have to think async
* don't use CPU intensive tasks 
* frameworks and tools may not be as mature, but they are in their teens, 20s?; ready for production.
* javascript "quirks"
```javascript
var that = this; 
```
```javascript
var someVar = []; //empty array
alert(someVar == false); //evaluates true
if (someVar) alert('hello'); //displays the alert
```
* callback hell
```javascript
getData(function(x){
    getMoreData(x, function(y){
        getMoreData(y, function(z){
            getMoreData(z, function(t){ 
                getMoreData(t, function(w){ 
                    ...
                });
            });
        });
    });
});
```
## Single threaded vs. multithreaded

Single threaded non-blocking I/O is better than multithreaded blocking I/O

![alt text][blocking-io]

![alt text][non-blocking-io]

## Enough bla, bla how do I use it?

###Install NodeJS
```bash
$ sudo apt-get install -y build-essential
$ curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
$ sudo apt-get install -y nodejs
$ node --version
```

###Run first program
```bash
$ git clone https://github.com/SpeedyC86/prezentare-nodejs.git
$ cd prezentare-nodejs/samples
$ node hello-world.js
```

###What can I use it for?

* executable nodes
* networking nodes:
  * TCP servers
  * Websocket servers
  * HTTP servers
  * DNS server
  * want more? you can use it as any type of networking or executable application your mind can conjure

###Executable nodes
```bash
$ node hello-world-1.js Hello
World!
```

```javascript
var myArgs = process.argv.slice(2);
switch (myArgs[0]) {
    case 'Hello':
        console.log("World!");
        break;
    default:
        console.log('How rude! You didn\'t even say Hello.');
}
```

###Networking nodes
You can create a HTTP server with just 5 lines of Javascript
```bash
$ node hello-world-2.js
```

Go to: [http://127.0.0.1:2222](http://127.0.0.1:2222)

```javascript
var http = require("http");

http.createServer(function (request, response) {

   // Send the HTTP header 
   // HTTP Status: 200 : OK
   // Content Type: text/plain
   response.writeHead(200, {'Content-Type': 'text/plain'});
   
   // Send the response body as "Hello World"
   response.end('Hello World!\n');
}).listen(2222);

// Console will print the message
console.log('Server running at http://127.0.0.1:2222/');
```

##Modules and NPM

* NodeJS relies on modules that are included using the **require** keyword.
* One example would be the **require("http")** from the previous example.
* Modules can be created easily, just put the javascript code in to a separate js file include it using the **require** keyword.
* Libraries in NodeJS are called packages and they can be installed using the command *$ npm install package*.
* NPM (Node package manager) is the official package manager for Nodejs and comes bundled with the Nodejs instalation.

###Web frameworks
Build powerful networking applications using NodeJS and the built-in networking features or instead of writing your Apache/Nginx NodeJS version use a web framework.

Web frameworks: Express, Connect, Zappa, ActionHero, etc

###Express
* fast, minimalistic
* handles most of the functionality found in web servers:
* available at: [//expressjs.com](http://expressjs.com/) or by using NPM

####Install Express

```bash
$ cd express-helloworld
$ npm init
$ npm install express --save
```

####Run Express

```bash
$ cd express-helloworld
$ node hello-world.js
```

Go to: [http://127.0.0.1:2222](http://127.0.0.1:2222)

```javascript
var express = require('express')
var app = express();
app.use(express.static('public'));

app.get('/', function(req, res) {
    res.sendFile(__dirname+'/index.html');
});

app.listen(2222);
console.log('Express server running at http://127.0.0.1:2222/');
```

###Socket.IO

Ok so we have client Javascript event handling, and server Javascript event handling but can we have full duplex server-client event handling what about realtime full duplex server-client event handling?

Yes we can! 

####Supported transports
* Websocket
* Adobe Flash Socket
* Comet:
  * Ajax polling
  * Ajax long polling
  * JSONP Polling (for cross-domain)
  * Forever Iframe
  * etc

####What are these transports?

I don't know. 
But I don't need to know because Socket.IO is a gateway that shields me from having to know the details of each transport.
It fallbacks to the transport that is supported by my browser. If I use a shitty browser it will go to a shitty almost realtime transport. If a use a modern browser it will go directly to Websocket.

####Websocket

![alt text][websocket]

Advantages:
* bidirectional
* cross-domain
* binary or text data

Disavantages:
* browser compatibility: <IE10, <Android 4.4, <Safari 6.0
* possible problems with proxies (use wss in production)

####Ajax polling

![alt text][ajax_polling]

Advantages:
* cross-domain requests
* unidirectional communication between client and server
* binary or text data

Disavantages:
* big delay between event and notification
* big number of requests
* big incomming trafic

####JSONP long polling

![alt text][jsonp]

Advantages:
* cross-domain requests
* unidirectional communication between client and server
* binary or text data

Disavantages:
* big delay between event and notification
* big number of requests
* big incomming trafic

####How to use?
```bash
$ cd socket-helloworld
$ npm init
$ npm install express --save
$ npm install socket.io --save 
```
Server Side code:
```javascript
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


io.on("connection", function (client) {// register listener for connected
    client.on("message", function (msg) {//register listener for receiving a message
        client.json.send({msg: msg}); // Sends a message to the client
        client.broadcast.json.send({msg: msg}); // Sends a message to all other clients.
    });

    client.on("disconnect", function () {
    }); // register listener for disconnected
});
```
Client Side code:
```javascript
var socket = io.connect(); // Establish a connection to host
socket.on('connect', function () { // register listener for connected
    console.log("connected");
});
socket.on('message', function (json) { // register listener for receiving a message
    console.log("message");
    console.log(json.msg);
    $("#message").text(json.msg);
});
socket.on('disconnect', function () { // regist listener for disconnected
    console.log("disconnected");
});

socket.send('Hello world!'); // send a message to server
setTimeout(function () {
    socket.disconnect(); // Closes the connection
}, 5000);
```

###Further reading:
* https://nodejs.org
* http://expressjs.com/
* http://socket.io/
* https://github.com/mongodb/node-mongodb-native
* http://docs.sequelizejs.com/en/latest/
* http://www.actionherojs.com/

###Resources:
* https://os.alfajango.com/websockets-slides/
* http://cjus.github.io/nodejs-presentation/
* http://www.slideshare.net/vikasing/introduction-to-nodejs-11730771
* https://nodejs.org
* http://sideeffect.kr:8001/
