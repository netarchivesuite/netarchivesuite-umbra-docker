#!/usr/bin/env bash
set -m
SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))


HOME=$( getent passwd "$USER" | cut -d: -f6 )
mkdir -p ${HOME}/chrome_logs

LOGFILE="${HOME}/chrome_logs/chrome.$$.log"

google-chrome \
--headless \
--no-sandbox \
$@ \
&>>$LOGFILE &

PID=$!
echo "Starting chrome with pid $PID" >>$LOGFILE
wait  $PID

echo "$PID ended with $?" >>$LOGFILE 