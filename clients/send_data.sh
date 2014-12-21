#!/bin/sh
while true; do
  python -c '
import json, random;from datetime import datetime as dt;
ts=dt.now().strftime("%Y-%m-%dT%H:%M:%S")
rnd = random.randint(1,20)
words = ["the", "quick", "brown", "fox", "jumps", "over", "lazy", "dog"]
random.shuffle(words)
word = words[0]
print json.dumps({"timestamp": ts, "number": rnd, "word": word})
' | \
  ./bin/kafka-console-producer.sh --topic test-topic --broker-list $KAFKA_PORT_9092_TCP_ADDR:$KAFKA_PORT_9092_TCP_PORT
  sleep 30
done

