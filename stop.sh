#!/usr/bin/env bash

PID=$(cat minecraft.pid)

kill $PID
echo "stop server "
while s=`ps -p $PID -o s=` && [[ "$s" && "$s" != 'Z' ]]; do
    echo -n "."
    sleep 1
done

rm minecraft.pid

echo
