# Nodejs Presentation

[logo]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/nodejs-logo.png "NodeJS"
[iot]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/iot.png "Interest over time"
[non-blocking-io]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/nodejs.png "Single threaded non-blocking I/O"
[blocking-io]: https://raw.githubusercontent.com/SpeedyC86/prezentare-nodejs/master/assets/apache.png "Multi threaded blocking I/O"
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
2. Got support from Google, Microsoft, IBM and legions of open source majority fat and single developers
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
* frameworks and tools may not be as mature but in their teens (ready for production)
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

NodeJS relies on modules that are included using the **require** keyword.
One example would be the **require("http")** from the previous example.
Modules can be created easily, just put the javascript code in to a separate js file include it using the **require** keyword.
Libraries in NodeJS are called packages and they can be installed using the command *$ npm install package*
NPM (Node package manager) is the official package manager for Nodejs and comes bundled with the Nodejs instalation

###Web frameworks
* build powerful networking applications using NodeJS and the built-in networking features
* instead of writing your Apache/Nginx NodeJS version use a web framework
* web frameworks: Express, Connect, Socket.IO, Zappa, ActionHero, etc

###Express
* fast, minimalistic
* handles most of the functionality found in web servers:
* available at: [//expressjs.com](http://expressjs.com/) or by using NPM

####Install Express

```bash
$ cd express-helloworld
$ npm init
$ npm install express --save
$ node hello-world.js
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


