#!/bin/bash

echo "No limits"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Limited (old Java 8)"
docker run --rm -it \
           -v $PWD:/src \
           -m 100M \
           --memory-swap -1 \
           -e CLASSPATH=/src \
           java \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Limited (latest Java 8)"
docker run --rm -it \
           -v $PWD:/src \
           -m 100M \
           --memory-swap -1 \
           -e CLASSPATH=/src \
           openjdk:8 \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Limited (latest Java 9)"
docker run --rm -it \
           -v $PWD:/src \
           -m 100M \
           --memory-swap -1 \
           -e CLASSPATH=/src \
           openjdk:9 \
           java -XX:+PrintFlagsFinal | grep MaxHeap

echo "Limited (latest Java 10)"
docker run --rm -it \
           -v $PWD:/src \
           -m 100M \
           --memory-swap -1 \
           -e CLASSPATH=/src \
           openjdk:10 \
           java -XX:+PrintFlagsFinal | grep MaxHeap
