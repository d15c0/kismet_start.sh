#! /bin/bash

sudo airmon-ng check kill

echo "set wlan1-4 into monitor mode"

sudo ip link set wlan0 down
sudo ip link set wlan1 down
sudo ip link set wlan2 down
sudo ip link set wlan3 down

sudo iw dev wlan0 set type monitor
sudo iw dev wlan1 set type monitor
sudo iw dev wlan2 set type monitor
sudo iw dev wlan3 set type monitor

sudo ip link set wlan0 up
sudo ip link set wlan1 up
sudo ip link set wlan2 up
sudo ip link set wlan3 up

echo "move some files around, start kismet"

sudo mkdir -p /home/$USER/backup_kismet_logs
sudo mkdir -p /home/$USER/kismet_logs

sudo mv /home/$USER/kismet_logs/* /home/$USER/backup_kismet_logs

sudo kismet -c wlan0 -c wlan1 -c wlan2 -c wlan3
#sudo kismet -c wlan1 -c wlan3

