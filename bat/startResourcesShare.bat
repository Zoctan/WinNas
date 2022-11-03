@echo off

:: Start in order

:: Function Discovery Resource Publication
sc config FDResPub start= AUTO
net start FDResPub

:: Function Discovery Provider Host
sc config fdPHost start= AUTO
net start fdPHost

:: UPnP Device Host
sc config upnphost start= AUTO
net start upnphost

:: SSDP Discovery
sc config SSDPSRV start= AUTO
net start SSDPSRV
