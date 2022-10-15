# 服务器生成SSL证书，供局域网其他电脑认证

软件：https://github.com/FiloSottile/mkcert/releases

## 安装证书，成为CA中心：

```
.\mkcert-v1.4.4-windows-amd64.exe -install
```

## 生成SSL证书:

```
.\mkcert-v1.4.4-windows-amd64.exe localhost 127.0.0.1 ::1 192.168.1.200
```

## 查找服务器的CA证书：

```
.\mkcert-v1.4.4-windows-amd64.exe -CAROOT
```

打开上面显示的路径，其中包含rootCA.pem证书文件和rootCA-key.pem密钥文件。

将rootCA.pem拷贝一个副本，并命名为rootCA.crt：
- rootCA-key.pem
- rootCA.crt
- rootCA.pem

## 局域网认证

将rootCA.crt共享给局域网的其他电脑，安装为根组织认证后即可SSL访问。
