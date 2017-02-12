FROM ubuntu
MAINTAINER Bipin Tiwari (email@domain.com)
#Updating all  packages
RUN yum update -y

#Installing Dependencies
RUN yum install -y wget tar

#installing Python27
RUN yum install -y centos-release-SCL
RUN yum install -y python27

#creating mongodb repo 
RUN echo -e "[mongodb]\nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.2/`uname -m`/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/mongodb.repo 
#installing Mongodb
RUN yum install -y mongodb-org
RUN chown -R mongod:mongod /var/lib/mongo

# Downloading JDK and installing its alternatives
RUN cd /opt;wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz; pwd 
RUN cd /opt;tar xvf jdk-7u55-linux-x64.tar.gz
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.55/bin/java 2

 
# Download Apache Tomcat 7
RUN cd /tmp;wget http://apache.mirrors.pair.com/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz
# untar and move to proper location
RUN cd /tmp;tar xvf apache-tomcat-7.0.75.tar.gz
RUN cd /tmp;mv apache-tomcat-7.0.75 /opt/tomcat7
#Changing permission
RUN chmod -R 755 /opt/tomcat7
#setting up java environment
ENV JAVA_HOME /opt/jdk1.7.0_55
#using port 8080 for connection
EXPOSE 8080
 
CMD /opt/tomcat7/bin/catalina.sh run
