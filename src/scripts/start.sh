#!/bin/bash

echo "Starting avahi..."
/usr/sbin/avahi-daemon -s

echo "Starting usbmuxd..."
/usr/sbin/usbmuxd

echo "Starting netmuxd..."
screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1

echo "Starting altserver..."
screen -S altserver -dm ./AltServer-aarch64