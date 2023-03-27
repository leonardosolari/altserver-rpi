#!/bin/bash

echo "Controllo file plist"
ls /var/lib/lockdown

echo "Starting avahi..."
rm -rf /run/avahi-daemon//pid
/usr/sbin/avahi-daemon -s


echo "Starting usbmuxd..."
#usbmuxd

echo "Starting netmuxd..."
screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1

echo "Starting altserver..."
./AltServer-aarch64
