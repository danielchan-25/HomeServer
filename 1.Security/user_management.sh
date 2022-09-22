#!/bin/sh

# cc为我个人使用的账号
useradd -d /home/cc cc
echo "123123" | passwd --stdin cc

# 放行 cc 用户登录SSH
echo 'AllowUsers cc' >> /etc/ssh/sshd_config

# 禁用 ROOT 用户登录 SSH
sed -i 's/PermitRootLogin yes/PermitRootLogin no/d' /etc/ssh/sshd_config
