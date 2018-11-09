#!/usr/bin/env bash

pushd rabbitmq
sudo singularity build rabbitmq.sif Singularity
popd

pushd umbra
sudo singularity build umbra.sif Singularity
popd