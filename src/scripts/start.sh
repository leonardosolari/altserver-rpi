#!/bin/bash

/etc/init.d/dbus start
echo "Starting avahi..."
systemctl enable --now avahi-daemon.service
service avahi-daemon status


echo "Starting usbmuxd..."
systemctl enable --now usbmuxd.service

echo "Starting netmuxd..."
screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1

echo "Starting altserver..."
./AltServer-aarch64