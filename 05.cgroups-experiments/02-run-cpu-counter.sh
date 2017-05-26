#!/bin/sh

echo "Host system:"
lscpu | grep Core

echo "Run container with no limits:"
docker run --rm -it \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java CPUCounter

echo "Stick container to one CPU:"
docker run --rm -it \
           --cpuset-cpus="0" \
           -v $PWD:/src \
           -e CLASSPATH=/src \
           java \
           java CPUCounter
