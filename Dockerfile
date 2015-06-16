FROM ubuntu:latest

MAINTAINER Tom Neumann <tom.neumann@stud.htwk-leipzig.de>

#Config and data
VOLUME /fuseki
ENV FUSEKI_BASE /fuseki
#Installation directory
ENV FUSEKI_HOME /jena-fuseki

#ENV DEPS pwgen
RUN export DEBIAN_FRONTEND=noninteractive && \
    rm -rf /var/libapt/lists/* && \
    apt-get update && \
    apt-get -y install perl tar wget curl openjdk-7-jre-headless && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/*


ADD ./jena-fuseki $FUSEKI_HOME
COPY shiro.ini /jena-fuseki/shiro.ini
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

#Loader
COPY load.sh /jena-fuseki/
COPY tdbloader /jena-fuseki/
RUN chmod 755 /jena-fuseki/load.sh /jena-fuseki/tdbloader

#Start the server from
WORKDIR /jena-fuseki
EXPOSE 3030
CMD ["/jena-fuseki/fuseki-server"]
