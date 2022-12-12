#! /bin/bash

#testing that container is running

docker container run --detach --publish 80:80 --name server.js alexogdfx/server.js:latest

docker container ls


