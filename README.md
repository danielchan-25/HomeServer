# HomeServer
## 购买背景

由于本人只有一台笔记本电脑，需要带去公司工作，家里没有老旧电脑，且想给家里的电视机、路由器、智能家居等设备提供服务，故购入服务器一台。

迫于钱包过于紧张，只能先入手一台 J1900

## 硬件信息

| 硬件     | 配置                                                         |
| -------- | ------------------------------------------------------------ |
| 整机尺寸 | 19.5cm * 19.5cm                                              |
| CPU      | J1900                                                        |
| 主板     | J1900 配套                                                   |
| 内存     | DDR3 4GB 1666MHz                                             |
| 存储     | 64GB SSD                                                     |
| 接口     | 千兆网口 x1<br />Mini PCIE x1<br />Mstat x1<br />Sata x2<br />VGA x1<br />HDMI x1<br />USB3.0 x1<br />USB2.0 x3 |
| 价格     | 286元                                                        |

## 操作系统

对比了各个系统，以及该主机的硬件属性，驱动等，最终选择了：**Kubuntu 20.04**

## 应用部署

### SSH

安装好操作系统，创建好新用户且设置好 root 密码后的第一件事：安装 SSH

```sh
sudo apt install openssh-server
# 安装服务端
sudo service sshd restart
# 安装客户端
sudo service ssh restart
```

### FTP

安装好电脑后，怎么把文件上传/下载到服务器上呢？使用FTP吧

```sh
sudo apt install vsftpd
# 备份配置文件
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
# 修改配置文件
# 创建ftp用户
sudo useradd -d /home/ftp -s /bin/bash ftpuser
sudo passwd ftpuser
# 创建vsftpd.chroot_list文件并添加允许ftp的用户
sudo vim /etc/vsftpd.chroot_list
# 创建FTP目录
sudo mkdir /data/soft

# 启动
systemctl start vsftpd && systemctl enable vsftpd
```

配置好 FTP 后，即可通过客户端对服务端进行上传/下载。

### Nginx

必备，提供 WEB 服务。

顺带配合 FTP，直接实现下载服务器上的文件功能，不用每次下载都要打开 FTP 客户端了。

```nginx
autoindex on;
autoindex_localtime on;
autoindex_exact_size on;
server {
	location /ftp {
                alias   /data/soft/;
        }
}
```

![image](https://user-images.githubusercontent.com/50611800/191492709-91a507a3-48f2-41d1-8971-4f2d65db257b.png)


### Docker

`docker` 几乎是家用服务器必装的软件，实在是太方便了。

```sh
# 安装
curl -sSL https://get.daocloud.io/docker | sh
```

安装好 `docker` 后，我习惯创建一个 `/data/docker` 目录，用于存放 `docker` 的各种资料。

#### Aria2

这个下载器估计没人不知道吧，简单好用，下载必备。

```sh
docker run -d \
--name aria2 \
--restart unless-stopped \
--log-opt max-size=1m \
-e PUID=$UID \
-e PGID=$GID \
-e UMASK_SET=022 \
-e RPC_PORT=6800 \
-e LISTEN_PORT=6888 \
-p 6800:6800 \
-p 6888:6888 \
-p 6888:6888/udp \
-v $PWD/aria2/config:/config \
-v $PWD/Downloads:/downloads \
p3terx/aria2-pro
```

部署好后，发现没 UI 界面，只能在 `Nginx` 下新增一个 `AriaNG.html` 即可。

> AriaNg 官网：http://ariang.mayswind.net/

每次访问都要在 URL 后添加文件名，太麻烦。

直接添加一个 `location` 反向代理到该文件方便多了。

```nginx
location /d {
	proxy_pass http://127.0.0.1/Aria2Ng.html;
}
```

#### 青龙面板

`JD`、`Bilibli` 等懂的都懂，薅羊毛必备。

```sh
docker run -dit \
-v $PWD/ql/config:/ql/config \
-v $PWD/ql/log:/ql/log \
-v $PWD/ql/db:/ql/db -p 5700:5700 \
--name ql \
--hostname ql \
--restart always \
whyour/qinglong:latest
```


