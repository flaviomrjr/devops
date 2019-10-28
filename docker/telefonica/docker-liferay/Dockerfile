FROM centos:centos7
MAINTAINER Flavio Rocha

RUN yum update ; yum  upgrade -y ; yum install java-11-openjdk.x86_64 vim telnet iproute -y	

RUN mkdir -p /servicios/liferay7

COPY ./configs/liferay7.2.0/ /servicios/liferay7/

RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/bin/startup.sh
RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/bin/catalina.sh
RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/bin/shutdown.sh
RUN touch /servicios/liferay7/tomcat-9.0.17/logs/catalina.out
RUN chmod 755 /servicios/liferay7/tomcat-9.0.17/logs/catalina.out

COPY ./configs/portal-ext.properties /servicios/liferay7/portal-ext.properties

VOLUME /servicios/liferay7

#CMD ["tail","-f","/servicios/liferay7/tomcat-9.0.17/logs/catalina.out"]
