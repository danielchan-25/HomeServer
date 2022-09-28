# HomeServer

# 购买背景

由于本人只有一台笔记本电脑，需要带去公司工作。

家里没有老旧电脑，且想给家里的电视机、路由器、智能家居等设备提供服务，故购入服务器一台。

迫于经费有限，只能先入手一台  **J1900**

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

- 修改默认 SSH 端口
- 设置 SSH 超时
- 设置错误密码后冻结
- 开启 SSH 日志
- 设置免密 sudo

# 应用部署

| 应用程序    | 注释                                                         | 截图                                                         |
| ----------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Nginx       | 必备，提供 WEB 服务。<br />免得收藏一大堆网页，直接在 `index.html` 里跳转算了 | <img width="694" alt="image" src="https://user-images.githubusercontent.com/50611800/191680745-d72b4db4-bdf6-4f6f-a5cb-492dc3061f83.png"> |
| Nginx + FTP | 不用每次下载都要打开客户端了。                               | <img width="843" alt="image" src="https://user-images.githubusercontent.com/50611800/191680779-ed5a69e7-496f-4053-ba63-e0efd42d279b.png"> |
| Portainer   | `Portainer` 用于查看管理 `Docker` 上运行的镜像/容器等，但感觉还是命令行方便点。 | <img width="1105" alt="image" src="https://user-images.githubusercontent.com/50611800/191656640-654456fd-47c3-4a0e-90a1-ee03ec2720c3.png"> |
| Aria2       | 这个下载器估计没人不知道吧，简单好用，必备下载工具。<br />配合 `Aria2Ng` 页面方便点。 | <img width="1110" alt="image" src="https://user-images.githubusercontent.com/50611800/191656015-df706f92-a4ec-4d95-abfe-2882b73d383c.png"> |
| 青龙面板    | `JD` 那些懂的都懂，薅羊毛必备。                              | <img width="1117" alt="image" src="https://user-images.githubusercontent.com/50611800/191656084-fc7cd875-6fd8-4b9e-86f2-5be2fb9fe8a0.png"> |
| RSSHub      | 用于订阅各种支持 rss 的网页，微博、豆瓣等一大堆都支持，超级方便。 | <img width="1056" alt="image" src="https://user-images.githubusercontent.com/50611800/191683230-9f836451-e86e-4b40-8c26-0182df8dcb65.png"> |
| LibreSpeed  | 当我怀疑自家网络出问题时，就用到这工具。                 | <img width="1106" alt="image" src="https://user-images.githubusercontent.com/50611800/191656300-85722109-0f16-498a-a428-446f5d4dd80f.png"> |
| UptimeKuma  | 监控服务，便于查看哪个服务没启动，简单好用。                 | <img width="1181" alt="image" src="https://user-images.githubusercontent.com/50611800/191680356-e6a49261-c3f9-443a-877c-d9f51ab7fb84.png"> |
| Prometheus  | 上面那个监控服务，这个就用来监控服务器。                     | <img width="1120" alt="image" src="https://user-images.githubusercontent.com/50611800/191680039-a43651ae-b288-4498-97b0-42d78015aecc.png"> |
| Piwigo      | 私有化相册，在家里使用，存在 `iCloud` 其实挺不错的，但还是有个本地备份安心一点。 | <img width="1105" alt="image" src="https://user-images.githubusercontent.com/50611800/191657155-dcc9427c-e7bd-4a4f-b543-df79cf66f237.png"> |
| Home-assistant      | 家庭自动化控制管理平台。 | <img width="418" alt="image" src="https://user-images.githubusercontent.com/50611800/191681222-4a5aa60c-c0e0-40ac-af06-0978b538e11c.png"> |
| Emby      | 家庭影音。 | ![image](https://user-images.githubusercontent.com/50611800/192724271-e1955c16-5cc9-4ec6-be37-6e593d5ea854.png) |



