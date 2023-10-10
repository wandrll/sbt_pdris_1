#!/bin/bash

PID_FILE="monitoringd.pid"

case $1 in

    STATUS)
        if test -f "$PID_FILE"; then
            echo "Daemon is working"
        else
            echo "Daemon is not working"
        fi
    ;;

    START)

        if test -f "$PID_FILE"; then
            echo "Daemon already working"
        else

            ./monitoring.sh &

            DAEMON_PID=$!

            echo $DAEMON_PID > $PID_FILE
        fi

    ;;

    STOP)
        if test -f "$PID_FILE"; then
            DAEMON_PID=$(cat $PID_FILE)
            kill -15 $DAEMON_PID
            rm $PID_FILE
        else
            echo "Can't stop daemon, because it is not working"
        fi

    ;;

    *)
        echo "Unknown input. Use STATUS, START or STOP"
    ;;

esac


