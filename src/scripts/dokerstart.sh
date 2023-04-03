#!/bin/bash

/etc/init.d/dbus start

echo "Printing env variables"
printenv

echo "Starting avahi..."
rm -rf /run/avahi-daemon//pid
/usr/sbin/avahi-daemon -s
ps -ef | grep avahi


echo "Starting usbmuxd..."
#/usr/sbin/usbmuxd --user usbmux --systemd
#ps -ef | grep usbmuxd


echo "Starting netmuxd..."
screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1

echo "Starting altserver..."
./AltServer-aarch64
