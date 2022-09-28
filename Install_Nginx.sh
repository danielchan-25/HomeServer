#!/bin/sh
# Nginx官网：https://nginx.org/

wget http://nginx.org/download/nginx-1.22.0.tar.gz
tar -xvf nginx-1.22.0.tar.gz
cd nginx-1.22.0
./configure
make & make install