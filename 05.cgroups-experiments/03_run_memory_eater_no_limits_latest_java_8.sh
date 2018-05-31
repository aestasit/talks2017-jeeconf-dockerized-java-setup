#!/bin/sh

echo "Showing default JVM heap settings for max. heap:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:8 \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Running memory eater with no limits:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:8 \
           java MemoryEater
