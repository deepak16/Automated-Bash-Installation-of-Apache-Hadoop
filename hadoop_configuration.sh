#!/bin/bash

#as we know that we have to make changes in five files in order to establish hadoop in pseudo distributed mode.
#firstly run the terminal in superuser mode
#configuring the first file i.e. .bashrc

echo "#HADOOP VARIABLES START
		export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
		export HADOOP_INSTALL=/usr/local/hadoop
		export PATH=$PATH:$HADOOP_INSTALL/bin
		export PATH=$PATH:$HADOOP_INSTALL/sbin
		export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
		export HADOOP_COMMON_HOME=$HADOOP_INSTALL
		export HADOOP_HDFS_HOME=$HADOOP_INSTALL
		export YARN_HOME=$HADOOP_INSTALL
		export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
		export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
		#HADOOP VARIABLES END" >> ~/.bashrc
		
#configuring the second file i.e. hadoop-env.sh
echo "here we will have explicitly tell the hadoop where our java is located"
echo "enter your java home path"
read java_home_path
sed -i 's,^\(JAVA_HOME=\).*,\1'java_home_path',' /usr/local/hadoop/etc/hadoop/hadoop-env.sh





#configuring the third file i.e. core-site.xml
sudo mkdir -p /app/hadoop/tmp
sudo chown hduser:hadoop /app/hadoop/tmp
sed -i '/<configuration>/r conf_file1.txt' /usr/local/hadoop/etc/hadoop/core-site.xml

#configuring the fourth file i.e mapred-site.xml
cp /usr/local/hadoop/etc/hadoop/mapred-site.xml.template /usr/local/hadoop/etc/hadoop/mapred-site.xml
sed -i '/<configuration>/r conf_file2.txt' /usr/local/hadoop/etc/hadoop/mapred-site.xml

#configuring the fifth file i.e. hdfs-site.xml
sudo mkdir -p /usr/local/hadoop_store/hdfs/namenode
sudo mkdir -p /usr/local/hadoop_store/hdfs/datanode
sudo chown -R hduser:hadoop /usr/local/hadoop_store
sed -i '/<configuration>/r conf_file3.txt' /usr/local/hadoop/etc/hadoop/hdfs-site.xml

