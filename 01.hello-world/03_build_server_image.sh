#!/bin/bash

docker build \
       --force-rm \
       -f Dockerfile \
       --tag=hello-world \
       .
