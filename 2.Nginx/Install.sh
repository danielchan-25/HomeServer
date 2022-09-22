#!/bin/sh

yum update -y
yum install -y net-tools vim wget curl
yum install -y  gcc-c++ gcc make pcre pcre-devel zlib zlib-devel openssl openssl-devel


wget https://nginx.org/download/nginx-1.22.0.tar.gz
tar -xvf nginx-1.22.0.tar.gz
cd nginx-1.22.0
./configure --prefix=/data/nginx
make && make install
