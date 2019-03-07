#!/bin/bash

_kill_procs() {
  kill -TERM $chromium
  wait $chromium
}
source /opt/rh/rh-python36/enable
python -V
# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

# Setup a trap to catch SIGSERV and relay it to child processes
trap _kill_procs SIGSEGV

#Find chrome flags at
# https://www.ghacks.net/2013/10/06/list-useful-google-chrome-command-line-switches/

echo Starting google-chrome
command="google-chrome \
--headless \
--no-sandbox \
--disable-3d-apis \
--disable-accelerated-video	\
--disable-background-mode \
--disable-gpu \
--disable-plugins \
--disable-plugins-discovery \
--disable-preconnect \
--disable-translate \
--disable-local-storage \
--full-memory-crash-report \
--log-level=0 $@ &"
echo "Running: $command"

$command
chromium=$!

echo "Running with the flags $(ps $chromium)"

wait $chromium

