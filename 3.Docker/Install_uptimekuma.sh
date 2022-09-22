#!/bin/sh

docker run \
--restart=always \
-p 53001:3001 \
-v /data/docker/uptime-kuma/data:/app/data \
--name uptime-kuma \
-d louislam/uptime-kuma
