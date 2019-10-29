FROM ubuntu:latest
MAINTAINER Flavio Rocha

RUN apt update ; apt-get upgrade -y ; apt install openjdk-8-jdk vim telnet -y

RUN mkdir -p /servicios/liferay7

COPY ./configs/liferay7.2.0/ /servicios/liferay7/

RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/bin/startup.sh
RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/bin/catalina.sh
RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/bin/shutdown.sh
RUN touch /servicios/liferay7/tomcat-9.0.17/logs/catalina.out
RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/logs/catalina.out

COPY ./configs/portal-ext.properties /servicios/liferay7/portal-ext.properties

VOLUME /servicios/liferay7

