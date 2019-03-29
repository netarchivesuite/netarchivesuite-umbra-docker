#!/usr/bin/env bash
set -b
SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))


HOME=$( getent passwd "$USER" | cut -d: -f6 )
mkdir -p ${HOME}/chrome_logs

LOGFILE="${HOME}/chrome_logs/chrome.$$.log"

handler()
{
    ##echo "Trapped SIGSEGV from $PID" >>$LOGFILE
    ##kill -TERM $PID
    ##echo In handler for exit of $1 with $2
    #kill -TERM $1
    echo "Killing children of ${$}:" >>$LOGFILE
    jobs -p >>$LOGFILE
    ##pgrep -P ${$} >>$LOGFILE
    pkill -TERM -P ${$} >>$LOGFILE
    exit 0
}

trap 'handler $! $?' SIGCHLD

echo "Spawning chrome from bash with pid $$" >>$LOGFILE

google-chrome \
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
--mute-audio \
--disable-gpu-early-init \
--enable-logging=stderr \
--log-level=0 \
--disable-dev-shm-usage \
$@ \
&>>$LOGFILE

##PID=$!
##trap 'if [[ $? -eq 139 ]]; then handler; fi' {1..64}
##trap 'handler $! $?' SIGCHLD

##wait $!
