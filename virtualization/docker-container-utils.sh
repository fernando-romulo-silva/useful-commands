# ===============================================================================
# Postgree

$ docker run --name test-postgres -e POSTGRES_DB=postgres-db -e POSTGRES_USER=user -e POSTGRES_PASSWORD=user -d -p 5432:5432 postgres:latest


# ===============================================================================
# MySql

$ docker run --name test-mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=mysql-db -e MYSQL_USER=user -e MYSQL_PASSWORD=user -d -p 3306:3306 mysql:latest


# ===============================================================================
# Active MQ
# http://0.0.0.0:8161 (firefox)
# user and password: admin
#                                       tcp            admin http   amqp         stomp
$ docker run --name test-activemq -d -p 61616:61616 -p 8161:8161 -p 5672:5672 -p 61613:61613 rmohr/activemq


# ===============================================================================
# Artemis MQ
# http://0.0.0.0:8161 (firefox)
# user and password: admin
#                                                                                                                  admin http   amqp           stomp
$ docker run --name test-artemis -d -e ARTEMIS_USERNAME=admin -e ARTEMIS_PASSWORD=admin -e ANONYMOUS_LOGIN=true -p 8161:8161 -p 61616:61616 -p 5672:5672 vromero/activemq-artemis:2.12.0-alpine




