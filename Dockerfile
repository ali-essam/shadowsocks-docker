FROM debian:stable-slim
RUN apt-get update && apt-get install -y wget
RUN mkdir -p /shadowsocks
WORKDIR /shadowsocks
RUN wget https://github.com/shadowsocks/shadowsocks-go/releases/download/1.2.1/shadowsocks-server.tar.gz
RUN tar -xf ./shadowsocks-server.tar.gz
COPY config.json ./
EXPOSE 8388
CMD ./shadowsocks-server

