#!/bin/bash
 
docker build \
       --tag=petclinic-maven:1.0 \
       -f Dockerfile.maven .
