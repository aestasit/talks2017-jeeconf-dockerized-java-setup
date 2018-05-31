#!/bin/sh

echo "Host system:"
lscpu | grep Core

echo "Run container with no limits (old Java 8):"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java CPUCounter

echo "Stick container to one CPU (old Java 8):"
docker run --rm -it \
           --cpuset-cpus="0" \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java CPUCounter


echo "Run container with no limits (latest Java 8):"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:8 \
           java CPUCounter

echo "Stick container to one CPU (latest Java 8):"
docker run --rm -it \
           --cpuset-cpus="0" \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:8 \
           java CPUCounter

echo "Run container with no limits (latest Java 9):"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:9 \
           java CPUCounter

echo "Stick container to one CPU (latest Java 9):"
docker run --rm -it \
           --cpuset-cpus="0" \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:9 \
           java CPUCounter

echo "Run container with no limits (latest Java 10):"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:10 \
           java CPUCounter

echo "Stick container to one CPU (latest Java 10):"
docker run --rm -it \
           --cpuset-cpus="0" \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           openjdk:10 \
           java CPUCounter

