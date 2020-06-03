#!/usr/bin/env bash

$MINECRAFT_USER="minecraft"
$MINECRAFT_HOME="/home/$MINECRAFT_USER"

sudo apt update
sudo apt -y install jq openjdk-8-jre-headless

sudo adduser --system --home $MINECRAFT_HOME $MINECRAFT_USER

sudo su - minecraft -s /bin/bash -c "wget -q https://github.com/Nantor/Raspberry-Pi-Minecraft-Server/raw/master/getServer.sh \
&& wget -q https://github.com/Nantor/Raspberry-Pi-Minecraft-Server/raw/master/start.sh \
&& wget -q https://github.com/Nantor/Raspberry-Pi-Minecraft-Server/raw/master/stop.sh \
&& chmod +x getServer.sh start.sh stop.sh \
&& (crontab -l 2>/dev/null; echo \"4 44 * * * /bin/bash $MINECRAFT_HOME\stop.sh && /bin/bash $MINECRAFT_HOME\start.sh\") | crontab - \
&& (crontab -l 2>/dev/null; echo \"@reboot /bin/bash $MINECRAFT_HOME\start.sh\") | crontab - \
&& echo eula=true > eula.txt \
&& ./getServer.sh \
&& nohup ./start.sh" > /dev/null
