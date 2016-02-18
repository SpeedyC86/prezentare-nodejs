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
https://goo.gl/NZGYl1


##Who fell in node with it?

1. Backed by the Node.js Foundation
2. Got support from Google, Microsoft, IBM and legions of open source majority fat and single developers
3. Used by:
..* Google   
..* Microsoft  
..* IBM   
..* LinkedIn  
..* Mozilla  
..* PayPay  
..* Uber   
..* and so many more, a true eye-catcher


##Really now... why NodeJS?

* crazy fast (core in C++ on top of V8 Engine)
* Asynchronous I/O Framework
* Single threaded (but that's ok)
* One language to rule them all (ECMAScript)
* Swiss army knife for network
* huge package ecosystem (npm)
 
##But...

* have to think async
* frameworks and tools may not be as mature but in their teens (ready for production)
* javascript "quirks"
```javascript
var that = this; 
```
```javascript
var someVar = []; //empty array
alert(someVar == false); //evaluates true
if (someVar) alert('hello');
```
* callback hell
```javascript
getData(function(x){
    getMoreData(x, function(y){
        getMoreData(y, function(z){ 
            ...
        });
    });
});
```
## Single threaded vs. multithreaded

* Single threaded non-blocking I/O can be better than multithreaded blocking I/O

![alt text][blocking-io]

![alt text][non-blocking-io]


* Multi threaded non-blocking I/O is a lot better than multithreaded blocking I/O



```bash
$ docker pull node 

//cat timp asteptam sa se downloadeze imaginea docker de nodejs
$ git clone https://github.com/SpeedyC86/prezentare-nodejs.git
$ cd prezentare-nodejs
```

```bash
$ docker pull node 

//cat timp asteptam sa se downloadeze imaginea docker de nodejs
$ git clone https://github.com/SpeedyC86/prezentare-nodejs.git
$ cd prezentare-nodejs
```

```bash
$ cd helloworld

//cat timp asteptam sa se downloadeze imaginea docker de nodejs
$ git clone https://github.com/SpeedyC86/prezentare-nodejs.git
$ cd prezentare-nodejs
```