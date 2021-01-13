#!/bin/bash

yum install docker -y

service docker start

chkconfig docker on

docker version

docker pull imhang/shadowsocks-docker

docker run -d --restart=always -e "SS_PORT=1224" -e "SS_PASSWORD=qwer1234." -e "SS_METHOD=salsa20" -e "SS_TIMEOUT=600" -p 1224:1224 -p 1224:1224/udp --name ssserver imhang/shadowsocks-docker

yum update 

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && sh bbr.sh 
