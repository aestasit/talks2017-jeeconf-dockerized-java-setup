#!/bin/bash

if [ -d "spring-petclinic" ]; then
  git -C spring-petclinic pull 
else
  git clone https://github.com/spring-projects/spring-petclinic.git  
fi

if [ -d "spring-framework-petclinic" ]; then
  git -C spring-framework-petclinic pull 
else
  git clone https://github.com/spring-petclinic/spring-framework-petclinic.git  
fi

