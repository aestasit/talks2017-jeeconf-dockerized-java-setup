
# Dockerized Java

## 01.hello-world

Run `javac` and `java` from within container for a single class.

- `01_compile_hello_world.sh` - compile Java code using `javac` from the `java` image. 
- `02_run_hello_world.sh` - run compiled Java class within a container.
- `03_build_hello_world_image` - build an image with Java class.
- `04_run_hello_world_from_image.sh` - run container based on the image built in the previous step.

## 02.knock-knock

Create network and run client and server as containers inside that network.

- `00_create_network.sh` - create the `knock-net` network.
- `01_compile_and_run_server.sh` - compile and run `knock-knock` server.
- `02_compile_and_run_client.sh` - compile and run `knock-knock` client.
- `03_build_server_image.sh` - build `knock-knock` server image.
- `04_build_client_image.sh` - build `knock-knock` client image.
- `05_run_server_from_image.sh` - run `knock-knock` server from image.
- `06_run_client_from_image.sh` - run `knock-knock` client from image.

## 03.petclinic-maven

Petclinic packaging and running.

- `00_get_code.sh` 
- `01_build_image_maven.sh`
- `02_build_image_for_tomcat.sh`
- `03_build_image_fat_jar.sh`
- `04_run_maven_container.sh`
- `05_run_tomcat_container_generic.sh`
- `05_run_tomcat_container_packaged.sh`
- `06_run_fatjar_container.sh`

## 04.shutdown-hook

Implementation of Java shutdown hook for graceful reaction to the `docker stop` command.

- `01_compile_code.sh`
- `02_run_server.sh`
- `03_stop_server.sh`
- `03_kill_server.sh`

## 05.cgroups-experiments

Experiments with memory limits and cpu sets.

- `00-compile-cpu-counter.sh`
- `00-compile-memory-eater.sh`
- `01-run-free.sh`
- `02-run-cpu-counter.sh`
- `03_run_memory_eater_no_limits.sh`
- `04_run_memory_eater_limited_memory.sh`
- `05_print_memory_defaults.sh`
