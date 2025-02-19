#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y psmisc screen vim cron
sudo service cron start
(crontab -l ; echo "*/5 * * * * $HOME/wildrig/check-wildrig.sh") | crontab -
