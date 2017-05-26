
docker run --rm -it \
           -v $PWD/src:/src \
           -v $PWD/target:/target \
           java \
           bash -c "javac -d /target /src/KnockKnockClient.java"

docker run --rm -it \
           -v $PWD/target:/target \
           -e CLASSPATH=/target \
           --name=knock-knock-client \
           --net=knock-knock \
           java \
           java KnockKnockClient knock-knock


