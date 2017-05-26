#!/bin/bash
 
docker volume create --name maven-repo
 
docker run -it --rm \
       -v $PWD/spring-petclinic:/src \
       -v maven-repo:/root/.m2 \
       -w /src \
       maven \
       mvn clean install spring-boot:repackage -DskipTests

docker build \
       --tag=petclinic-fatjar:1.0 \
       -f Dockerfile.fatjar .
