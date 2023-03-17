FROM ubuntu

RUN \
apt update && apt upgrade && \
apt install -y libavahi-compat-libdnssd-dev usbmuxd ninja-build ldc libplist-dev libimobiledevice-dev
libgtk-3-0 dub screen && \
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && \
rustup toolchain install stable && \
rustup default stable && \
apt install -y libusbmuxd-dev build-essential pkg-config checkinstall git autoconf automake libtool-bin libplist-dev openssl

COPY src/ .

ENTRYPOINT ["/bin/run.sh"]