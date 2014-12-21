[
   {
      "firehose": {
         "type": "kafka-0.8",
         "feed": "test-topic",
         "parser": {
            "timestampSpec": {
               "format": "iso",
               "column": "timestamp"
            },
            "data": {
               "format": "json"
            }
         },
         "consumerProps": {
            "zookeeper.connect": "ZOOKEEPER_HOSTNAME:ZOOKEEPER_PORT",
            "group.id": "drud-test-group",
            "auto.commit.enable": "false",
            "zookeeper.session.timeout.ms": "15000",
            "zookeeper.sync.time.ms": "5000",
            "auto.offset.reset": "largest",
            "fetch.message.max.bytes": "1048586",
            "zookeeper.connection.timeout.ms": "15000"
         }
      },
      "plumber": {
         "basePersistDirectory": "/tmp/realtime/basePersist",
         "segmentGranularity": "hour",
         "type": "realtime",
         "windowPeriod": "PT5m"
      },
      "config": {
         "intermediatePersistPeriod": "PT5m",
         "maxRowsInMemory": 500000
      },
      "schema": {
         "indexGranularity": "minute",
         "aggregators": [
            {
               "name": "count_words",
               "type": "count"
            }
         ],
         "dataSource": "druid_test",
         "shardSpec": {
            "type": "none"
         }
      }
   }
]

