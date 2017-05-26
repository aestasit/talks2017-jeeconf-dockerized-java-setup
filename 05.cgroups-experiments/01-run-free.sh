#!/bin/sh

echo "No limits"
docker run --rm -it java free

echo "Memory limited to 100M, swap is unlimited"
docker run --rm -it --memory 100M --memory-swap -1 java free
