#!/bin/bash
FUSEKI_HOME=/opt/fuseki/apache-jena-fuseki-2.0.0/
OPTS=${OPTS:-"--update --loc=/data /ds"}
cd /opt/fuseki/apache-jena-fuseki-2.0.0/
./fuseki-server $OPTS
