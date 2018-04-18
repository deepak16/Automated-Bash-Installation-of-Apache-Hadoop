#!/bin/bash
#bash script to install hadoop 2.7.2 in pseudo distributed mode(Single Node Cluster)


#1 We should have minimal 1.7 version of java installed in our system,otherwise we will have to install it.
#2 Run the terminal in "superuser" mode.

sudo apt-get update
apt-get -y install openjdk-7-jdk

#3 Now , we will disable IPv6

echo "# disable ipv6" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf

#4 We add a dedicated Hadoop User , creating a group called hadoop and adding a dedicated hadoop user to it.
sudo addgroup hadoop
sudo adduser --ingroup hadoop hduser

#5 Now , we will install ssh if not it already exists for switching between our dedicated hadoop user or the normal user
sudo apt-get -y install ssh

#6 We give hduser Sudo Permission
sudo adduser hduser sudo

#7 Now we setup SSH Certificates for our dedicated hadoop user
su hduser
ssh-keygen -t rsa -P ""
#8adding the generated key to the list of authorized keys
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

#9 Now we will install HADOOP
su hduser
wget http://mirrors.sonic.net/apache/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz

#10 We will untar it and put it in usr/local/hadoop
tar xvzf hadoop-2.7.2.tar.gz
cd hadoop-2.7.2
sudo mkdir /usr/local/hadoop
sudo mv * /usr/local/hadoop
