#!/bin/bash
 
docker volume create --name maven-repo
 
docker run -it --rm \
       -v $PWD/spring-framework-petclinic:/src \
       -v maven-repo:/root/.m2 \
       -w /src \
       maven \
       mvn clean install war:war -DskipTests

docker build \
       --tag=petclinic-tomcat:1.0 \
       -f Dockerfile.tomcat .
