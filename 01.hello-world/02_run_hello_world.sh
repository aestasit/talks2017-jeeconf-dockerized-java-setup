#!/bin/bash

docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java HelloWorld
