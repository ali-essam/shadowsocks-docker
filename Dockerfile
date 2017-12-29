FROM debian:stable-slim

ENV SS_VERSION 1.6.10

RUN mkdir -p /shadowsocks
RUN apt-get update && apt-get install -y curl xz-utils
WORKDIR /shadowsocks
RUN curl -SL https://github.com/shadowsocks/shadowsocks-rust/releases/download/v$SS_VERSION/shadowsocks-v$SS_VERSION-release.x86_64-unknown-linux-musl.tar.xz | tar -xJf - ssserver
RUN mkdir conf
COPY ./conf/sample.config.json ./config.json
EXPOSE 8388
CMD cat ./conf/config.json && ./ssserver -c ./conf/config.json
