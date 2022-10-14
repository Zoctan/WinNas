Syncthing是开源的文件同步程序，利用Syncthing项目的服务器，可以在多台计算机之间同步文件。

参考搭建：https://cloud.tencent.com/developer/article/1982866
官网：https://syncthing.net/
官网文档：https://docs.syncthing.net/
客户端：https://syncthing.net/downloads/
（Integrations版方便但是和这里用的自建相冲突，因为其包含了Syncthing核心）
（只需要web交互界面的选择Base Syncthing版）

Windows web客户端已经下好放在上层目录 ../SyncthingWebClient.exe

# 自建发现服务器和中继服务器

但为了提高文件同步的效率，我们可以通过自建发现服务器（discovery-server）和中继服务器（relay-server）的方法。

发现服务器：用于发现互联网上的同伴。
中继服务器：当双方无法直接建立数据连接时，才会利用中继服务器进行数据连接，若用中继服务器进行连接，则流量会流过服务器。

建好后，发现服务器和中继服务器各自会生成**device ID**（日志可看），同时，会生成自签名的证书和数据库。

command命令的配置部分说明：
-debug：表示启动debug输出（建议开启）
-listen：表示数据监听的端口
-pools：加入的中继服务器池，若为空，则表示该为个人私有，不允许其他人使用该中继服务（建议为空）

- GLOBAL_RATE=100000000 # 全局速率限制 单位为bytes/s
- PER_SESSION_RATE=10000000 # 每个会话速率限制 单位为bytes/s
- MESSAGE_TIMEOUT=1m30s #等待相关消息到达的最长时间
- NATWORK_TIMEOUT=3m0s # 客户端和中继服务器之间的操作超时时间
- PING_INTERVAL=1m30s # ping的发送频率

# 客户端Syncthing的设置

在每个Syncthing客户端上进行都要一样配置：设置 - 连接：

1. Global Discovery Servers（全局发现服务器）
default,https://公网IP:8443/?id=发现服务器device ID

2. Sync Protocol Listen Servers（协议监听地址）
default,relay://公网IP:22067/?id=中继服务器device ID

通过侦听程序和设备发现的数量，可以判断客户端是否成功连接上了自建服务。

关于发现服务器的https证书来源，官网提到了三种证书的选择：
1、CA机构发布的证书
2、自建发现服务器在建好后根据device ID自动生成的证书（推荐）
3、利用反向代理

前两种证书，对应的发现服务器地址，需要传递device ID，而第三种无需传递device ID

# 两个客户端Syncthing进行同步

1、互相添加对方为远程设备
在客户端A，点击添加远程设备，扫描或输入客户端B的device ID
（比如安卓客户端，扫描添加 Nas 客户端二维码）

2、等待一段时间，发现服务器会自动提醒有新客户端A加入。
（Nas 客户端会提示安卓客户端加入）

3、选择共享文件夹（两个客户端的文件夹ID要一致）

手机数据备份到 Nas 后删除，但不删除 Nas 上的数据：
1、Nas - Advanced - Folders - 选择需要忽略删除动作的 Folder - 选择 ignoreDelete；
2、Nas 的共享文件夹 Folder Type 要选择 Receive Only；
3、手机的共享文件夹 Folder Type 要选择 Send Only。

