#!/bin/bash
sudo systemctl enable --now avahi-daemon.service
sudo systemctl enable --now usbmuxd.service
screen -S netmuxd -dm ./bin/aarch64-linux-netmuxd --disable-unix --host 127.0.0.1
screen -S altserver -dm bash -c "export USBMUXD_SOCKET_ADDRESS=127.0.0.1:27015; export ALTSERVER_ANISETTE_SERVER="http://127.0.0.1:6969"; ./bin/AltServer-aarch64"
