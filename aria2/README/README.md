aria2参考：https://p3terx.com/archives/docker-aria2-pro.html
ariang参考：https://p3terx.com/archives/aria2-frontend-ariang-tutorial.html

## 403错误 Request Entity Too Large
清除浏览器所有缓存即可

## AriaNg 修改配置重启后恢复

在 AriaNg （或其它前端面板）中对 Aria2 设置的修改只会保存在内存中，不会修改配置文件，即属于临时修改，只在当前运行的进程中有效。Aria2 重启或关闭后会重新读取配置文件。这是 Aria2 的特性决定的并是不 bug ，所以必要的设置需写入到 Aria2 配置文件中。

如果要一键连接RPC，可以使用命令行API，不用每次都设置密钥。（base64编码secret）
http://192.168.1.200:6880/#!/settings/rpc/set/http/192.168.1.200/6800/jsonrpc/cHAwODE2
