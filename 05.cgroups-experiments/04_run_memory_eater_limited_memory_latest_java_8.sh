#!/bin/sh

echo "Showing default JVM heap settings for max. heap:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           -m 100M \
           openjdk:8 \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Running memory eater with container memory limitted to 100M:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           -m 100M \
           openjdk:8 \
           java MemoryEater
