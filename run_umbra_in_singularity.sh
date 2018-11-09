#!/usr/bin/env bash

set -e

#Start rabbitmq
mkdir -p rabbitmq-data
singularity instance.start \
    --cleanenv \
    --bind ./rabbitmq-data:/var/lib/rabbitmq \
    rabbitmq/rabbitmq.sif \
    rabbitmq

#Wait for it
umbra/wait-for-it.sh localhost:5672 -- echo

#Start umbra
SINGULARITYENV_ACTIVEMQ_SERVER=localhost \
SINGULARITYENV_ACTIVEMQ_PORT=5672 \
SINGULARITYENV_ACTIVEMQ_USER=guest \
SINGULARITYENV_ACTIVEMQ_PASS=guest \
singularity instance.start \
    --cleanenv \
    umbra/umbra.sif \
    umbra

