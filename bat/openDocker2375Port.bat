@echo off

netsh interface portproxy add v4tov4 listenport=2375 listenaddress=192.168.1.200 connectaddress=127.0.0.1 connectport=2375

net stop iphlpsvc
net start iphlpsvc
