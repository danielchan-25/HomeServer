# HomeServer

# 购买背景

由于本人只有一台笔记本电脑，需要带去公司工作，家里没有老旧电脑，且想给家里的电视机、路由器、智能家居等设备提供服务，故购入服务器一台。

迫于钱包过于紧张，只能先入手一台 J1900

# 硬件信息

| 硬件     | 配置                                                         |
| -------- | ------------------------------------------------------------ |
| 整机尺寸 | 19.5cm * 19.5cm                                              |
| CPU      | J1900                                                        |
| 主板     | J1900 配套                                                   |
| 内存     | DDR3 4GB 1666MHz                                             |
| 存储     | 64GB SSD                                                     |
| 接口     | 千兆网口 x1<br />Mini PCIE x1<br />Mstat x1<br />Sata x2<br />VGA x1<br />HDMI x1<br />USB3.0 x1<br />USB2.0 x3 |
| 价格     | 286元                                                        |

# 操作系统

对比了各个系统，以及该主机的硬件属性，驱动等，最终选择了：**Kubuntu 20.04**

# 安全加固

虽说只是在家里纯内网使用，但还是要做好安全加固这个好习惯。

首先是禁止 `ROOT` 用户远程登录，只允许我自己的用户有登录 SSH 的权限，且修改 SSH 默认端口。

然后就应安装 SSH，能让我随时用其它设备远程登录上，而不是只能在服务器上操作。

还有一些 SSH 的基本安全设置：

- 修改默认SSH端口
- 设置 SSH 超时
- 设置错误密码后冻结
- 开启SSH日志
- 设置免密sudo

# 应用部署

## FTP

安装好电脑后，怎么把文件上传/下载到服务器上呢？使用FTP吧

配置好 FTP 后，即可通过客户端对服务端进行上传/下载。

## Nginx

必备，提供 WEB 服务。

顺带配合 FTP，直接实现下载服务器上的文件功能，不用每次下载都要打开 FTP 客户端了。

<img width="1111" alt="image" src="https://user-images.githubusercontent.com/50611800/191656485-7e6fe5e9-2121-43c3-a897-85f8142c5520.png">


## Docker

`docker` 几乎是家用服务器必装的软件，实在是太方便了。

安装好 `docker` 后，我习惯创建一个 `/data/docker` 目录，用于存放 `docker` 的各种资料。


### Portainer

`Portainer` 用于查看管理 `Docker` 上运行的镜像/容器等，但感觉还是命令行方便点。

<img width="1105" alt="image" src="https://user-images.githubusercontent.com/50611800/191656640-654456fd-47c3-4a0e-90a1-ee03ec2720c3.png">


### Aria2

这个下载器估计没人不知道吧，简单好用，必备下载工具。

部署好后，发现没 UI 界面，只能在 `Nginx` 下新增一个 `AriaNG.html` 即可。

> AriaNg 官网：http://ariang.mayswind.net/

每次访问都要在 URL 后添加文件名，太麻烦，直接添加一个 `location` 反向代理到该文件方便多了。

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/50611800/191656015-df706f92-a4ec-4d95-abfe-2882b73d383c.png">


### 青龙面板

`JD`、`Bilibli` 等懂的都懂，薅羊毛必备。

<img width="1117" alt="image" src="https://user-images.githubusercontent.com/50611800/191656084-fc7cd875-6fd8-4b9e-86f2-5be2fb9fe8a0.png">


### Rsshub

用于订阅各种支持 rss 的网页，微博、豆瓣等一大堆都支持，超级方便。

<img width="1109" alt="image" src="https://user-images.githubusercontent.com/50611800/191656225-855b47d6-310c-41c7-bd6b-6618fb70b7d6.png">


### 测速工具

下载东西太慢，当我怀疑自家网络的速率时，就用到这工具。

<img width="1106" alt="image" src="https://user-images.githubusercontent.com/50611800/191656300-85722109-0f16-498a-a428-446f5d4dd80f.png">


### uptimeKuma

顺带部署个简单的监控，免得有些服务没起来还不知道呢，还挺简单好用的。


