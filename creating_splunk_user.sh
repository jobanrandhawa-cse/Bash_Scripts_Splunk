#!/bin/bash

if id "splunk" &>/dev/null; then
        /opt/splunk/bin/splunk stop
        chown splunk:splunk /opt/splunk
        chown -R splunk:splunk /opt/splunk/*
    if [ -d "/data" ]
      then
        chown splunk:splunk /data
        chown -R splunk:splunk /data/splunk
     fi

else
        useradd -m -d /opt/splunk -s /usr/bin/bash splunk
        /opt/splunk/bin/splunk stop
        chown splunk:splunk /opt/splunk
        chown -R splunk:splunk /opt/splunk/*
    if [ -d "/data" ]
      then
        chown splunk:splunk /data
        chown -R splunk:splunk /data/splunk
     fi
fi

# starting splunk instance....
echo "Starting splunk..."

        /opt/splunk/bin/splunk enable boot-start -user splunk
        /opt/splunk/bin/splunk start
