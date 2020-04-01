#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'

sudo apt-get install -y python python-pip graphviz python-dev nmap wpscan nikto dirbuster leafpad figlet nano theharvester docker docker-compose docker.io python3-dnspython python3-geoip python3-whois python3-requests python3-ssdeep nodejs npm wafw00f arp-scan
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking if Sifter is installed${NC}"
if [[ -d /opt/sifter ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sifter is already installed."
	echo -e "${NC}"
else
	pwd && cd ..
	sudo cp -r sifter -t /opt
	sudo chown $USER:$USER -R /opt/sifter
	cd /opt/sifter
    sudo cp sifter /usr/sbin/sifter
	sudo chmod +x /opt/sifter/sifter /usr/sbin/sifter
	sudo chmod +x -R /opt/sifter/modules
	sleep 2
fi

echo -e "${RED}Checking for external dependencies${NC}"
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Omnibus${NC}"
if [[ -d /opt/omnibus ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Omnibus is already installed."
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/InQuest/omnibus.git
	cd omnibus
	sudo pip install -r requirements.txt
	sleep 2
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for DomainFuzz${NC}"
if [[ -d /opt/DomainFuzz ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sublist3r is already installed."
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/monkeym4ster/DomainFuzz.git
	sleep 2
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for DnsTwist${NC}"
if [[ -d /opt/dnstwist ]]; then
	echo -e "${ORNG}"
	figlet -f mini "DnsTwist is already installed."
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/elceef/dnstwist.git
	cd dnstwist
	sudo apt-get install libgeoip-dev libffi-dev
	BUILD_LIB=1 pip install -r requirements.txt
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Flan${NC}"
if [[ -d /opt/flan ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Flan is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/s1l3nt78/flan.git
	cd flan
	sudo docker build .
	echo -e "${W}Please copy and paste the final container's image ID shown above"
	read ID
	sudo docker tag ${ID} flan_scan
	sleep 2
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for HoneyCaught${NC}"
if [[ -d /opt/HoneyCaught ]]; then
	echo -e "${ORNG}"
	figlet -f mini "HoneyCaught is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/aswinmguptha/HoneyCaught.git
	cd HoneyCaught
	sudo python -m pip install -r requirements.txt
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Blackwidow${NC}"
if [[ -f /usr/bin/blackwidow && -f /usr/bin/injectx.py ]] || [[ -f /usr/sbin/blackwidow && -f /usr/sbin/injectx.py ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Blackwidow is already installed"
	echo -e "${NC}"
else
	cd /root
	sudo git clone https://github.com/1N3/blackwidow.git
	cd blackwidow
	    sudo cp blackwidow /usr/sbin/blackwidow
	    sudo cp injectx.py /usr/sbin/injectx.py
	    pip install -r requirements.txt
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Rapidscan${NC}"
if [[ -f "/usr/sbin/rapidscan.py" ]] || [[ -d "/opt/rapidscan" ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Rapidscan is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/s1l3nt78/rapidscan.git
	cd rapidscan
	sudo chmod +x rapidscan.py rapidscan
	sudo mv rapidscan -t /usr/sbin
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Yuki-Chan${NC}"
if [[ -d "/root/Yuki-Chan-The-Auto-Pentest" ]] || [[ -d "/root/yuki" ]]; then
    echo -e "${ORNG}"
	figlet -f mini "Yuki-Chan is already installed"
	echo -e "${NC}"
else
    cd /root
    sudo git clone https://github.com/s1l3nt78/Yuki-Chan-The-Auto-Pentest.git
    sudo mv Yuki-Chan-The-Auto-Pentest yuki
	cd yuki
	   sudo pip2 install -r requirements.txt
	   sudo pip3 install -r requirements.txt
	   sudo chmod +x Module --recursive
	   sudo chown $USER:$USER Module --recursive
	   sudo chmod +x wafninja joomscan yuki.sh install-perl-module.sh
	   sudo ./install-perl-module.sh
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for ShodanSploit${NC}"
if [[ -d "/opt/shodansploit" ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ShodanSploit is already installed."
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/shodansploit/shodansploit.git
	sudo chown $USER:$USER -R shodansploit
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for ReconSpider${NC}"
if [[ -d "/opt/reconspider" ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ReconSpider is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/bhavsec/reconspider.git
	cd reconspider
	sudo python3 setup.py install
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Attack Surface Mapper${NC}"
if [[ -d /opt/AttackSurfaceMapper ]] || [[ -d /root/AttackSurfaceMapper ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ASM is already installed."
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/s1l3nt78/AttackSurfaceMapper.git
	cd AttackSurfaceMapper
	   sudo python3 -m pip install -r requirements.txt
	   sudo cp asm -t /usr/sbin
	   sudo chmod +x /usr/sbin/asm
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for ActiveReign${NC}"
if [[ -d '/opt/ActiveReign' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ActiveReign is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/m8r0wn/ActiveReign.git
	cd ActiveReign
	sudo pip3 install -r requirements.txt
	sudo python3 setup.py install
	pip3 install prompt-toolkit==2.0.9 impacket
	ar3 db help
	sudo cp ar3/config.json -t /home/$USER/.ar3
	sudo chown $USER:$USER /home/$USER/.ar3
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for iSpy${NC}"
if [[ -d '/opt/ispy' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "iSpy is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/Cyb0r9/ispy.git
	cd ispy
	chmod +x setup.sh
	sudo ./setup.sh
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Sitadel${NC}"
if [[ -d '/opt/Sitadel' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sitadel is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/shenril/Sitadel.git
	cd Sitadel
	sudo python3 -m pip install .
	python3 setup.py install
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Konan${NC}"
if [[ -d '/opt/Konan' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Konan is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/m4ll0k/Konan.git
	cd Konan
	sudo pip install -r requirements.txt
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for SniffingBear${NC}"
if [[ -d '/opt/SniffingBear' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "SniffingBear is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/MrSuicideParrot/SniffingBear.git
	cd SniffingBear
	sudo pip install -r requirements.txt
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Osmedeus${NC}"
if [[ -d '/opt/docker-osmedeus' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Osmedeus is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/mablanco/docker-osmedeus.git
	cd docker-osmedeus
	sudo docker build -t mablanco/osmedeus .
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for NekoBot${NC}"
if [[ -d '/opt/NekoBotV1' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "NekoBot is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/tegal1337/NekoBotV1.git
fi

echo -e "${W}===========================================================================================${NC}"
# asnip
echo -e "${YLW}Installing & Updating aSnip${NC}"
go get -u github.com/harleo/asnip

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Armory${NC}"
if [[ -d '/opt/armory' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Armory is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/depthsecurity/armory.git
	cd armory
	sudo python3 setup.py install
	armory
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Seeker${NC}"
if [[ -d '/opt/seeker' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sherlock is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/thewhiteh4t/seeker.git
	cd seeker
	sudo chmod 777 install.sh
	./install.sh
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for AapFinder${NC}"
if [[ -d '/opt/aapfinder' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "AapFinder is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/Technowlogy-Pushpender/aapfinder.git
	sudo chown $USER:$USER -R aapfinder
	cd aapfinder
	sudo chmod +x aapfinder.py
	sudo touch targets.txt
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Dark Star${NC}"
if [[ -d '/opt/Dark-Star' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Dark Star is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/s1l3nt78/Dark-Star.git
	cd bfac
	sudo python setup.py install
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for BFAC${NC}"
if [[ -d '/opt/bfac' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "BFAC is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/mazen160/bfac.git
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for BruteDUM${NC}"
if [[ -d '/opt/BruteDum' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "BruteDUM is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/GitHackTools/BruteDum.git
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for OneFind${NC}"
if [[ -d '/opt/onedrive_user_enum' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "OneDrive UserSearch is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/nyxgeek/onedrive_user_enum
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for SMBGhost${NC}"
if [[ -d '/opt/SMBGhost' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "SMBGhost is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/ioncodes/SMBGhost.git
	sudo python3 -m pip install hexdump
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Maryam${NC}"
if [[ -d '/opt/Maryam' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Maryam is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/saeeddhqan/Maryam.git
	cd Maryam
	sudo pip install -r requirements
	sudo chmod +x maryam
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for xRay${NC}"
if [[ -d '/opt/xray' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "xRay is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/evilsocket/xray.git
	cd xray
	sudo docker build -t xraydocker .
fi

echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for WPForce${NC}"
if [[ -d '/opt/WPForce' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "WPForce is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/n00py/WPForce.git
fi

cd /opt
sudo chown $USER:$USER /opt/sifter --recursive
sudo chown $USER:$USER /usr/sbin/sifter
chmod +x /opt/sifter --recursive
chmod +x /usr/sbin/sifter
#echo "127.0.0.1" >> /opt/sifter/files/host_list.txt
cd /opt/sifter
#./sifter -c
echo -e "${RED}"
figlet "Done."
echo -e "${NC}"
sifter -h
echo -e "${W}Please edit API keys in /opt/AttackSurfaceMapper/keylist.asm for a better range of scans &"
echo -e "for better results in WPScan goto modules/wpscan.sh and add"
echo -e " '--api-token <your-wpscan-api-token>' argument to both commands"
echo -e "please add your shodan-api key to modules/credmods/xray.sh by 'SHODAN-API'${NC}"
