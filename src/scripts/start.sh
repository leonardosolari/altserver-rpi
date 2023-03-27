#!/bin/bash

echo "Starting avahi..."
rm -rf /run/avahi-daemon//pid
/usr/sbin/avahi-daemon -s
service avahi-daemon status


echo "Starting usbmuxd..."
#usbmuxd

echo "Starting netmuxd..."
screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1

echo "Starting altserver..."
./AltServer-aarch64
