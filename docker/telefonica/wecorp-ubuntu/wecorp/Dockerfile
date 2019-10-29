FROM ubuntu:latest
MAINTAINER Flavio Rocha

RUN apt update ; apt-get upgrade -y ; apt install openjdk-8-jdk vim telnet -y

RUN mkdir -p /servicios/wecorp5

COPY wecorp5/ /servicios/wecorp5/

RUN chmod 755 /servicios/wecorp5/tomcat-7.0.35/bin/startup.sh
RUN chmod 755 /servicios/wecorp5/tomcat-7.0.35/bin/catalina.sh
RUN chmod 755 /servicios/wecorp5/tomcat-7.0.35/bin/shutdown.sh
RUN touch /servicios/wecorp5/tomcat-7.0.35/logs/catalina.out
RUN chmod 755 /servicios/wecorp5/tomcat-7.0.35/logs/catalina.out

VOLUME /servicios/wecorp5

