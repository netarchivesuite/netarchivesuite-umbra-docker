# netarchivesuite-umbra-docker

This is a very simple docker-compose project to run a complete umbra system. The `docker-compose.yml` file
specifies two ports:

 1. The socket port for amqp connections, by default mapped to port 8998 on localhost
 1. The port for the RabbitMQ web-gui, by default mapped to port 8999 on localhost
  
RabbitMQ is started with the default username and password guest/guest. These can be overridden in the 
`docker-compose.yml` file if needed. See the rabbitmq/docker documentation at https://hub.docker.com/_/rabbitmq/ .

Typical usage of this project would be
 1. `docker-compose -f ./netarchivesuite-umbra-docker/docker-compose.yml -p PROD_UMBRA build`  
 1. `docker-compose -f ./netarchivesuite-umbra-docker/docker-compose.yml -p PROD_UMBRA -d up`