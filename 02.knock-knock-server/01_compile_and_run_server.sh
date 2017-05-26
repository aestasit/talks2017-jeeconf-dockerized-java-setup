
rm -rf ./target

mkdir  ./target

docker run --rm -it \
           -v $PWD/src:/src \
           -v $PWD/target:/target \
           java \
           bash -c "javac -d /target /src/KnockKnockServer.java /src/KnockKnockProtocol.java"

docker run --rm -it \
           -d \
           -v $PWD/target:/target \
           -e CLASSPATH=/target \
           -p 4444:4444 \
           --net=knock-knock \
           --name=knock-knock \
           java \
           java KnockKnockServer
