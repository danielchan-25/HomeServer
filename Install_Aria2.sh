docker run -d \
--name aria2 \
--restart unless-stopped \
--log-opt max-size=1m \
-e PUID=$UID \
-e PGID=$GID \
-e UMASK_SET=022 \
-e RPC_SECRET=123456 \
-e RPC_PORT=6800 \
-e LISTEN_PORT=6888 \
-p 6800:6800 \
-p 6888:6888 \
-p 6888:6888/udp \
-v $PWD/aria2/config:/config \
-v $PWD/Downloads:/downloads \
p3terx/aria2-pro