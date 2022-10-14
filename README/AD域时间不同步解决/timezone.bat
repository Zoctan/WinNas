w32tm /config /manualpeerlist:ntp.dtops.cc /syncfromflags:manual /reliable:yes /update
w32tm /config /update
net stop w32time
net start w32time
w32tm /resync /rediscover
w32tm /query /source