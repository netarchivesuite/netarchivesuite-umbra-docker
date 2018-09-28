ulimit -c 0
drain-queue --url amqp://guest:guest@activemq:5672/%2f
umbra -n 1 --executable /usr/bin/run-chromium  --url amqp://guest:guest@activemq:5672/%2fumbra 
