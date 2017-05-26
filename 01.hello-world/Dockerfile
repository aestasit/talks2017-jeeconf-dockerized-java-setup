FROM java:8

ADD ./HelloWorld.java /src/HelloWorld.java

RUN /usr/bin/javac /src/HelloWorld.java

ENV CLASSPATH=/src

CMD /usr/bin/java HelloWorld
