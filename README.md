# Jokes Application

This application is an exercise for learning how to build micro-services. It is not meant to be optimized nor to dictate one way or another to build micro-services application.

It consists of a backend micro-service (jokes server) and a frontend micro-service (the portal).

There are two branches: master and no-chuck.

The master branch enables two types of jokes while the no-chuck branch only enables neutral jokes.

The master branch frontend runs on port 8080 while its backend runs on port 5000.

The no-chuck branch frontend runs on port 9090 while its backend runs on port 5555.

Each branch uses different docker image tags.

## How to use

- clone repository

```
git clone https://github.com/dmontagner/jokes-app
```

- Build and run frontend and backend on master branch

```
cd jokes-app
make build
```

Point your web browser to [http://127.0.0.1:5000](http://127.0.0.1:5000)

- Build and run frontend and backend on no-chuck branch

```
cd jokes-app
git checkout no-chuck
make build
```

Point your web browser to [http://127.0.0.1:5555](http://127.0.0.1:5555)

## Other commands available

```
make stop
make start
make restart
make clean  ## does not clean everything
```