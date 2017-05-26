#!/bin/bash

docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java -XX:+PrintFlagsFinal | grep MaxHeap

docker run --rm -it \
           -v $PWD:/src \
           -m 100M \
           --memory-swap -1 \
           -e CLASSPATH=/src \
           java \
           java -XX:+PrintFlagsFinal | grep MaxHeap


