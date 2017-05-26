#!/bin/bash
 
docker run --rm -dit \
       --name=petclinic \
       -v $PWD/spring-framework-petclinic/target/petclinic.war:/usr/local/tomcat/webapps/petclinic.war \
       -p 8080:8080 \
       tomcat:8 
