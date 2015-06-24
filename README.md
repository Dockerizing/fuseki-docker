# fuseki-docker
The Docker is based on the [stain/jena-fuseki](http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VOSIndex) Docker image and includes an [Apache Jena Fuseki 2](http://jena.apache.org/documentation/fuseki2/) server installation. 

## Usage Instructions
After building the image you can run it with the following options:

`–p` to expose port 3030
  
  docker run -p "your fuseki2 port":3030 fuseki2-docker:latest
  
You can modify the port which should be used by the use of –p and run ./fuseki-server –port="new port"
docker run -p "your fuseki2 port":"new port" fuseki2-docker:latest ./fuseki-server –port="new port"


`-d` to run the container in detached mode

  docker run –d -p "your fuseki2 port":3030 fuseki2-docker:latest


`-e` ADMIN_PASSWORD="your password" to set your password, default password is admin 

  docker run -p "your fuseki2 port":3030 –e ADMIN_PASSWORD="your password"  fuseki2-docker:latest

## Data
The Fuseki data is stored at the docker volume `/fuseki` within the container. If you remove the container without a backup the stored data will be lost. To get more information about the variations of data persistence read [stain/jena-fuseki paragraph “Data persistence”](https://registry.hub.docker.com/u/stain/jena-fuseki/). 
You can load data through the web interface or an integrated load script load.sh, it is using the [tdbloader command line utilities](https://jena.apache.org/documentation/tdb/commands.html). To use this load script you currently need a fuseki volume-container (see [stain/jena-fuseki](https://registry.hub.docker.com/u/stain/jena-fuseki/)). You could also directly use the tdbloader.

Customizing the Fuseki configuration
You can customize the <shiro.ini> configuration in many ways (e.g. add users, userroles, etc.), to get more information about customizing see [Apache Shiro Configuration](https://shiro.apache.org/configuration.html).
