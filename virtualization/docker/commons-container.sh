# ===============================================================================
# PostgreSQL
#
$ docker run --name test-postgres --env POSTGRES_DB=postgres-db --env POSTGRES_USER=user --env POSTGRES_PASSWORD=user --detach --publish 5432:5432 postgres:latest
#
# ===============================================================================
# MySql
#
$ docker run --name test-mysql --env MYSQL_ROOT_PASSWORD=root --env MYSQL_DATABASE=mysql-db --env MYSQL_USER=user --env MYSQL_PASSWORD=user --detach --publish 3306:3306 mysql:latest
#
# ===============================================================================
# Oracle
# hostname: localhost
# port: 1521
# sid: xe
# username: system
# password: oracle
#
$ docker run --name test-oracle --env ORACLE_ALLOW_REMOTE=true --detach --publish 1521:1521 wnameless/oracle-xe-11g-r2
#
# ===============================================================================
# Active MQ
# http://0.0.0.0:8161 (firefox)
# user and password: admin
#                                                       tcp               admin http            amqp                  stomp
$ docker run --name test-activemq --detach --publish 61616:61616 --publish 8161:8161 --publish 5672:5672 --publish 61613:61613 rmohr/activemq
#
# ===============================================================================
# Artemis MQ
# http://0.0.0.0:8161 (firefox)
# user and password: admin
#                                                                                                                  admin http   amqp           stomp
$ docker run --name test-artemis --detach --env ARTEMIS_USERNAME=admin --env ARTEMIS_PASSWORD=admin --env ANONYMOUS_LOGIN=true --publish 8161:8161 --publish 61616:61616 --publish 5672:5672 vromero/activemq-artemis:2.12.0-alpine
#
# ===============================================================================
# Rabbit MQ
# http://localhost:15672 (firefox) 
# user and password: admin
#
$ docker run --hostname my-rabbit \
	--name some-rabbit \
	--detach \
	--env RABBITMQ_DEFAULT_USER=admin \
	--env RABBITMQ_DEFAULT_PASS=admin \
	--env RABBITMQ_DEFAULT_VHOST=my_vhost \
	--publish 5672:5672 \
	--publish 15672:15672 \
	rabbitmq:3-management
#
# ===============================================================================
# Graphite
#
$ docker run --detach \
	--name graphite-server \
	--publish 80:80 \
	--publish 2003-2004:2003-2004 \
	--publish 2023-2024:2023-2024 \
	--publish 8125:8125/udp \
	--publish 8126:8126 \
	graphiteapp/graphite-statsd
#
# ===============================================================================
# Grafana
# user and password: admin
#
$ docker run --detach --name graphana-server --publish 3000:3000 grafana/grafana
#
# ===============================================================================
# Prometeus
#
$ docker run --detach --name=prometheus \
		--publish 9090:9090 \
		--volume src/main/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus \
		--config.file=/etc/prometheus/prometheus.yml
#
# ===============================================================================
# Kafka
#		
$ docker run --detach \
			--env KRAFT_CONTAINER_HOST_NAME=kafka \
			--env KRAFT_CREATE_TOPICS=topic-a,topic-b,topic-c \
			--env KRAFT_PARTITIONS_PER_TOPIC=3 \
			--env KRAFT_AUTO_CREATE_TOPICS=true \
			--publish 9093:9093 \
			moeenz/docker-kafka-kraft
		
# Go inside the container (use exec)
$ cd /opt/kafka/bin

# Create a topic named 'samples'
$ sh kafka-topics.sh --bootstrap-server localhost:9093 --create --topic samples --partitions 1 --replication-factor 1		

# Consuming events
$ sh kafka-console-consumer.sh --bootstrap-server localhost:9093 --topic samples --property "print.headers=true" --property "print.key=true" --property "print.timestamp=true"

# Writing events (You can stop the producer client with Ctrl-C at any time)
$ sh kafka-console-producer.sh --topic samples --bootstrap-server localhost:9093
This is my first event

# Writing events with header
$ sh kafka-console-producer.sh --topic samples --bootstrap-server localhost:9093 --property "parse.headers=true" --property "headers.key.separator=:" --property "headers.delimiter=;"

# --property parse.key=true
# Payload format "header_name:header_value;payload_value" Ex:
person:org.system.Person;{"name": "Jane Doe", "age": 20}
__TypeId__:boleto;{"linhaDigitavel": "123456789"} # spring boot

# Connect to the metadata
$ sh kafka-metadata-shell.sh --snapshot /tmp/kraft-combined-logs/__cluster_metadata-0/00000000000000000167.log
#

# -----------
$ docker run --detach \
		-it --publish 18080:8080 \
		--env DYNAMIC_CONFIG_ENABLED=true \
		--env KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=localhost:9093 \
		provectuslabs/kafka-ui

# ===============================================================================
# Mongo DB
# uri: mongodb://root:root@127.0.0.1:27017/mydatabase?authSource=admin&authMechanism=SCRAM-SHA-1
# or
# uri: mongodb://user:secret@127.0.0.1:27017/mydatabase?authSource=admin&authMechanism=SCRAM-SHA-1
# 
$ docker run --name test-mongo --detach \
		--env MONGO_INITDB_ROOT_USERNAME=root \
		--env MONGO_INITDB_ROOT_PASSWORD=root \
		--env MONGO_INITDB_DATABASE=admin \
		--env MONGO_NON_ROOT_USERNAME=user \
		--env MONGO_NON_ROOT_PASSWORD=secret \
		--publish 27017:27017 \
		--publish 28017:28017 \
		mongo:latest

# uri mongodb://root:root@127.0.0.1:27017/mydatabase?authSource=admin&authMechanism=SCRAM-SHA-1		
$ docker run --name test-mongo --detach \
		--env MONGODB_ROOT_USER=root \
		--env MONGODB_ROOT_PASSWORD=root \
		--env MONGODB_REPLICA_SET_MODE=primary \
		--env MONGODB_REPLICA_SET_NAME=rs0 \
		--env MONGODB_REPLICA_SET_KEY=123456 \
		--env MONGODB_ADVERTISED_HOSTNAME=localhost \
		--env MONGODB_USERNAME=user \
		--env MONGODB_PASSWORD=user \
		--env MONGODB_DATABASE=mydatabase \
		--publish 27017:27017 \
		bitnami/mongodb:latest