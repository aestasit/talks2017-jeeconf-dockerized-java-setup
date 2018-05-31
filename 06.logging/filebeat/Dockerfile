FROM busybox

COPY filebeat-5.2.0-linux-x86_64/filebeat /filebeat
COPY filebeat.yml /filebeat.yml
COPY filebeat-5.2.0-linux-x86_64/filebeat.template.json /filebeat.template.json
COPY filebeat-5.2.0-linux-x86_64/filebeat.template-es2x.json /filebeat.template-es2x.json

CMD ["/filebeat", "-e", "-d", "*", "/filebeat.yml"]