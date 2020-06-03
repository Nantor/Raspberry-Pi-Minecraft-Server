#!/usr/bin/env bash

java -Xmx2560M -Xms1024M -jar server.jar nogui </dev/null &>/dev/null &
echo $! > minecraft.pid

