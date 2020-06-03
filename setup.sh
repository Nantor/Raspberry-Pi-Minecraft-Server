#!/usr/bin/env bash

sudo apt update
sudo apt -y install jq openjdk-8-jre-headless

sudo adduser --system --home /home/minecraft minecraft

sudo su - minecraft -s /bin/bash -c "wget -q https://github.com/Nantor/Raspberry-Pi-Minecraft-Server/raw/master/getServer.sh" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "wget -q https://github.com/Nantor/Raspberry-Pi-Minecraft-Server/raw/master/start.sh" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "wget -q https://github.com/Nantor/Raspberry-Pi-Minecraft-Server/raw/master/stop.sh" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "chmod +x getServer.sh start.sh stop.sh" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "(crontab -l 2>/dev/null; echo \"4 44 * * * /bin/bash /home/minecraft/stop.sh && /bin/bash /home/minecraft/start.sh\") | crontab -" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "(crontab -l 2>/dev/null; echo \"@reboot /bin/bash /home/minecraft/start.sh\") | crontab -" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "echo eula=true > eula.txt" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "./getServer.sh" 2>&1 > /dev/null
sudo su - minecraft -s /bin/bash -c "nohup ./start.sh" 2>&1 > /dev/null
