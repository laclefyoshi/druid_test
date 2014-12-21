#!/bin/sh
sed -i -e 's/zookeeper.connect=localhost:2181/zookeeper.connect='$ZOOKEEPER_PORT_2181_TCP_ADDR':'$ZOOKEEPER_PORT_2181_TCP_PORT'/' \
  -e 's/#host.name=localhost/host.name='$(ping -c 1 `hostname`|head -1|awk '{print $3}'|sed -e 's/[\(\)]//g')'/' \
  /opt/kafka_2.10-0.8.1.1/config/server.properties
./bin/kafka-server-start.sh -daemon config/server.properties
sleep 60
./bin/kafka-topics.sh --delete --zookeeper $ZOOKEEPER_PORT_2181_TCP_ADDR:$ZOOKEEPER_PORT_2181_TCP_PORT \
  --topic test-topic || \
./bin/kafka-topics.sh --create --zookeeper $ZOOKEEPER_PORT_2181_TCP_ADDR:$ZOOKEEPER_PORT_2181_TCP_PORT \
  --replication-factor 1 --partitions 1 --topic test-topic || echo "OK"
tailf ./logs/server.log

