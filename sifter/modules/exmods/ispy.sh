#!/bin/bash

ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'

echo -e "${ORNG}"
figlet -f mini "iSpy"
echo -e "${NC}"
cd /opt/ispy
sudo ./ispy
sleep 2
cd /opt/sifter
sifter -m