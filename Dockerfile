FROM ubuntu

RUN \
apt update && apt upgrade && \
apt install -y libavahi-compat-libdnssd-dev usbmuxd ninja-build ldc libplist-dev libimobiledevice-dev libgtk-3-0 dub screen curl wget

#INSTALL RUST
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup toolchain install stable && \
rustup default stable

RUN apt install -y libusbmuxd-dev build-essential pkg-config checkinstall git autoconf automake libtool-bin libplist-dev openssl
WORKDIR /bin
RUN wget https://github.com/NyaMisty/AltServer-Linux/releases/download/v0.0.5/AltServer-aarch64 && wget https://github.com/jkcoxson/netmuxd/releases/download/v0.1.4/aarch64-linux-netmuxd && chmod +x *

#RUN NETMUXD AND ALTSERVER
RUN /etc/init.d/docker avahi-daemon.service
RUN usbmuxd
RUN screen -S netmuxd -dm ./aarch64-linux-netmuxd --disable-unix --host 127.0.0.1
ENV USBMUXD_SOCKET_ADDRESS=127.0.0.1:27015
ENV ALTSERVER_ANISETTE_SERVER="http://192.168.1.7:6969"

RUN screen -S altserver -dm ./AltServer-aarch64
