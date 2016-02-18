docker pull node (!!! dureaza 5 minute pe fir)

docker build -t code932/nodejs-helloworld .

///docker run -it --rm --name nodejs-running-app nodejs-basic
docker run -it --rm --name nodejs-helloworld-script -v "$PWD/../nodejs-helloworld":/usr/src/app -w /usr/src/app nodejs-basic-app
docker run -it --rm --name nodejs-helloworld-script -v "$PWD/../nodejs-helloworld":/usr/src/app -w /usr/src/app node:5 node main.js




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