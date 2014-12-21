#!/bin/sh

sed -i -e 's/druid.host=HOSTNAME/druid.host='`hostname`'/' \
  -e 's/druid.zk.service.host=ZOOKEEPER_HOSTNAME/druid.zk.service.host='$ZOOKEEPER_PORT_2181_TCP_ADDR'/' /opt/druid-services-0.6.160/test_conf/runtime.properties
sed -i -e 's/"zookeeper.connect": "ZOOKEEPER_HOSTNAME:ZOOKEEPER_PORT"/"zookeeper.connect": "'$ZOOKEEPER_PORT_2181_TCP_ADDR':'$ZOOKEEPER_PORT_2181_TCP_PORT'"/' /opt/druid-services-0.6.160/test_conf/realtime.spec

java -Xmx1024M -Duser.timezone=UTC -Dfile.encoding=UTF-8 \
  -Ddruid.realtime.specFile=/opt/druid-services-0.6.160/test_conf/realtime.spec \
  -classpath /opt/druid-services-0.6.160/lib/*:/opt/druid-services-0.6.160/test_conf io.druid.cli.Main example realtime

