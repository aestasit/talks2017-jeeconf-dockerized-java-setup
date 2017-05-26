#!/bin/bash

docker run --rm -it \
           -v $PWD:/src \
           java \
           bash -c "javac /src/GracefulServer.java"
