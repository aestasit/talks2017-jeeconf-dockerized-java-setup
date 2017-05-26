#!/bin/bash

docker rm -f graceful

docker run -dit \
           --name=graceful \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java GracefulServer
