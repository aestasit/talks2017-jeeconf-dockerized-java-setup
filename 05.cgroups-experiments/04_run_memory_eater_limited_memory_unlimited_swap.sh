#!/bin/sh

echo "Showing default JVM heap settings for max. heap:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           -m 100M \
           --memory-swap -1 \
           java \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Running memory eater with container memory limitted to 100M:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           -m 100M \
           --memory-swap -1 \
           java \
           java MemoryEater
