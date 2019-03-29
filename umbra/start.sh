#!/usr/bin/env bash
ulimit -c 0
drain-queue --url amqp://guest:guest@activemq:5672/%2f
umbra -n 5 --executable /usr/bin/run-chromium  --url amqp://guest:guest@activemq:5672/%2f

#From test system
#/opt/rh/rh-python36/root/usr/bin/python3 /opt/rh/rh-python36/root/usr/bin/umbra -n 5 --executable /home/test/run-google-chrome.sh --url amqp://guest:guest@localhost:5672/%2f &> ${HOME}/umbra.log &
#disown

#See also
#/opt/rh/rh-python36/root/usr/bin/drain-queue
