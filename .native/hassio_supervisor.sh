#!/bin/bash

echo " "
echo "Ensure that you have read the documentation on installing Hass.io before continuing."
echo "Not following the installation instructions may render you system to be unable to connect to the internet."
echo "Hass.io Documentation: "
echo "  https://sensorsiot.github.io/IOTstack/Containers/Home-Assistant/"

echo " "
sleep 1

read -r -n 1 -p "Press Y to continue, any other key to cancel " response;

if [[ $response == "y" || $response == "Y" ]]; then
	echo "Install requirements for Hass.io"
	sudo apt install -y bash jq curl avahi-daemon dbus
	sudo systemctl disable ModemManager
	sudo systemctl stop ModemManager
	curl -sL "https://raw.githubusercontent.com/Kanga-Who/home-assistant/master/supervised-installer.sh" | sudo bash -s -- -m "qemuarm-64"
	clear
	exit 0

else
	clear
	exit 5
fi