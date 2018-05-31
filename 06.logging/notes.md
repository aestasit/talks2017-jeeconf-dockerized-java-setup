

1. Clone code


	git clone https://github.com/spring-projects/spring-petclinic petclinic


2. Create petclinic/Dockerfile
	
        FROM java:8		
        ADD . /app		
        ENV M2_HOME /app	
        EXPOSE 8080	
        WORKDIR /app
        RUN chmod a+x /app/mvnw
        RUN /bin/bash -c '/app/mvnw -e install spring-boot:repackage -DskipTests'
        CMD /app/mvnw -e spring-boot:run -DskipTests	

3. Get FileBeat 

        cd filebeat
        wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.2.0-linux-x86_64.tar.gz
        tar xvf filebeat-5.2.0-linux-x86_64.tar.gz

4. filebeat/Dockerfile
	
          FROM busybox
	  COPY filebeat-5.2.0-linux-x86_64/filebeat /filebeat
	  COPY filebeat.yml /filebeat.yml
	  COPY filebeat-5.2.0-linux-x86_64/filebeat.template.json /filebeat.template.json
	  COPY filebeat-5.2.0-linux-x86_64/filebeat.template-es2x.json /filebeat.template-es2x.json
	  CMD ["/filebeat", "-e", "-d", "*", "/filebeat.yml"]
	
5. Create filebeat.yml

          filebeat.prospectors:
            - input_type: log
              paths: ["/containers/*/*-json.log"]
              json.keys_under_root: true
              json.overwrite_keys: true
              json.add_error_key: true
              json.message_key: "log"
              tags: ["json"]
          output.elasticsearch:
              hosts: ["elasticsearch:9200"]
		
6. Configure logback

		 <configuration>
		    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
		        <encoder>
		            <pattern>%-30(%d{yyyy-MM-dd'T'HH:mm:ss.SSS} [%-25thread]) %-5level %logger{32} - %msg%n</pattern>
		        </encoder>
		    </appender>
		    <appender name="JSON" class="ch.qos.logback.core.rolling.RollingFileAppender">
		        <file>logs/garagetravel.log</file>
		        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
		            <fileNamePattern>logs/garagetravel%i.log</fileNamePattern>
		            <minIndex>1</minIndex>
		            <maxIndex>10</maxIndex>
		        </rollingPolicy>
		        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
		            <maxFileSize>50MB</maxFileSize>
		        </triggeringPolicy>
		        <encoder class="net.logstash.logback.encoder.LogstashEncoder" />
		    </appender>
		    <appender name="EVENTS_JSON" class="ch.qos.logback.core.rolling.RollingFileAppender">
		        <file>logs/events.log</file>
		        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
		            <fileNamePattern>logs/events%i.log</fileNamePattern>
		            <minIndex>1</minIndex>
		            <maxIndex>10</maxIndex>
		        </rollingPolicy>
		        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
		            <maxFileSize>50MB</maxFileSize>
		        </triggeringPolicy>
		        <encoder class="net.logstash.logback.encoder.LogstashEncoder" />
		    </appender>
		    <appender name="ASYNC_STDOUT" class="reactor.logback.AsyncAppender">
		        <includeCallerData>false</includeCallerData>
		        <appender-ref ref="STDOUT"/>
		    </appender>
		    <appender name="ASYNC_JSON" class="reactor.logback.AsyncAppender">
		        <includeCallerData>false</includeCallerData>
		        <appender-ref ref="JSON"/>
		    </appender>
		    <root level="INFO">
		        <appender-ref ref="ASYNC_JSON"/>
		        <appender-ref ref="ASYNC_STDOUT"/>
		    </root>
		</configuration>

