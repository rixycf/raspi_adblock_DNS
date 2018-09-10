#!/bin/bash

#----------------------------------
#  @rixycf 2018/09/08
#  rasberry pi init setting script
#
#----------------------------------


declare -r TIMEZONE=Asia/Tokyo

sudo raspi-config nonint do_expand_rootfs


sudo raspi-config nonint do_ssh 0
#                   └─ non interractive

sudo raspi-config nonint do_change_timezone "$TIMEZONE"

## setting wifi
# sudo sh -c "wpa_passphrase $SSID $PASS >> /etc/wpa_supplicant/wpa_supplicant.conf"

sudo apt -y update
sudo apt -y upgrade
sudo apt dist-upgrade
sudo apt install -y rpi-update
sudo rpi-update
sudo reboot 

