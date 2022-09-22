docker run -dit \
-v $PWD/ql/config:/ql/config \
-v $PWD/ql/log:/ql/log \
-v $PWD/ql/db:/ql/db -p 5700:5700 \
--name ql \
--hostname ql \
--restart always \
whyour/qinglong:latest
