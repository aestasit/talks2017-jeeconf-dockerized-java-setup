#!/bin/sh

echo "No limits (old Java 8)"
docker run --rm -it java free

echo "Memory limited to 100M, swap is unlimited (old Java 8)"
docker run --rm -it --memory 100M --memory-swap -1 java free


