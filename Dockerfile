FROM ubuntu:latest

MAINTAINER Tom Neumann <tom.neumann@stud.htwk-leipzig.de>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install perl tar wget curl openjdk-7-jre-headless

RUN mkdir /opt/fuseki
ADD apache-jena-fuseki-2.0.0.tar.gz /opt/fuseki/
RUN ls /opt/fuseki

ADD script/start-fuseki.sh /opt/fuseki/apache-jena-fuseki-2.0.0/start-fuseki.sh
#RUN chmod +x /opt/fuseki/apache-jena-fuseki-2.0.0/fuseki-server /opt/fuseki/apache-jena-fuseki-2.0.0/s-* /opt/fuseki/apache-jena-fuseki-2.0.0/start-fuseki.sh
RUN chmod +x /opt/fuseki/apache-jena-fuseki-2.0.0/fuseki-server /opt/fuseki/apache-jena-fuseki-2.0.0/start-fuseki.sh

RUN mkdir /data

EXPOSE 3030

VOLUME ["/data"]

CMD ["/opt/fuseki/apache-jena-fuseki-2.0.0/start-fuseki.sh"]
