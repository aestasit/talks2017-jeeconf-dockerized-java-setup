#!/bin/bash
 
docker run --rm -dit \
       --name=petclinic \
       -p 8080:8080 \
       petclinic-maven:1.0 
