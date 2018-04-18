#!/bin/bash

#to test hadoop we can execute the below commands
hadoop namenode -format

#Starting Hadoop
su hduser
sudo chown -R hduser:hadoop /usr/local/hadoop/
cd /usr/local/hadoop/sbin
start-all.sh

#Testing if it is working 
	jps

	netstat -plten | grep java

#Alternatively we can also see the web interface of the namenode at	http://localhost:50070/

#Stopping Hadoop
stop-all.sh

