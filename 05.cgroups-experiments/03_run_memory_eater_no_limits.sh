#!/bin/sh

echo "Showing default JVM headp settings for max. heap:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Running memory eater with no limits:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java MemoryEater
