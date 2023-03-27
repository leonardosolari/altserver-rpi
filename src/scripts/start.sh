#!/bin/bash

echo "Controllo file plist"
ls /var/lib/lockdown

echo "Starting avahi..."
rm -rf /run/avahi-daemon//pid
/etc/init.d/avahi-daemon start


echo "Starting usbmuxd..."
usbmuxd

echo "Starting netmuxd..."
screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1

echo "Starting altserver..."
screen -S altserver -dm ./AltServer-aarch64

echo "Active screens:"
screen -ls