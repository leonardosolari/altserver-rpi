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

COPY src/ .

RUN chmod +x run.sh

ENTRYPOINT ["run.sh"]