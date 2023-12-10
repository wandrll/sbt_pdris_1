#!/bin/bash

PID_FILE="monitoringd.pid"
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
case $1 in

    STATUS)
        if test -f "$PARENT_PATH/$PID_FILE"; then
            echo "Daemon is working"
        else
            echo "Daemon is not working"
        fi
    ;;

    START)

        if test -f "$PARENT_PATH/$PID_FILE"; then
            echo "Daemon already working"
        else

            $PARENT_PATH/monitoring.sh &

            DAEMON_PID=$!

            echo $DAEMON_PID > $PARENT_PATH/$PID_FILE
        fi

    ;;

    STOP)
        if test -f "$PARENT_PATH/$PID_FILE"; then
            DAEMON_PID=$(cat $PARENT_PATH/$PID_FILE)
            kill -15 $DAEMON_PID
            rm $PARENT_PATH/$PID_FILE
        else
            echo "Can't stop daemon, because it is not working"
        fi

    ;;

    *)
        echo "Unknown input. Use STATUS, START or STOP"
    ;;

esac


