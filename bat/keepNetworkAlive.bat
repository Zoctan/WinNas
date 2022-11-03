:: check network status every 30s:
:: if alive, no action.
:: if not alive, try another wifi. 
@ECHO off

SET wifi1=CMCC-555
SET wifi2=903
SET currentWifi=%wifi1%
SET pingHost=www.baidu.com
SET logFile=wifi.log
SET tryTimes=0

:: get wifi ssid
:getCurrentWifi
FOR /f "tokens=3" %%i IN ('netsh wlan show interface ^| findstr /i "SSID"') DO SET "currentWifi=%%i" & GOTO checkStatus

:: check network status
:checkStatus
ECHO [%date% %time%] check %currentWifi% status
CHOICE /t 30 /d y /n >NUL
ping -n 4 "%pingHost%" | findstr /r /c:"[0-9] *ms" >NUL
IF ERRORLEVEL 1 ((ECHO [%date% %time%] no network and try to change wifi) && GOTO startConnect)
IF ERRORLEVEL 0 ((ECHO [%date% %time%] network is ok and next check will be taken after 30s) && GOTO checkStatus)
PAUSE > NUL

:: connect wifi
:startConnect
IF %currentWifi%==%wifi1% (SET currentWifi=%wifi2%) ELSE (SET currentWifi=%wifi1%)
SET /A tryTimes+=1
ECHO [%date% %time%] try to connect[%tryTimes%]: %currentWifi%
netsh wlan connect ssid=%currentWifi% name=%currentWifi%
SET /A tryTimes=0
CHOICE /t 5 /d y /n >NUL
netsh WLAN show interfaces | findStr %currentWifi% >NUL
IF ERRORLEVEL 1 ((ECHO [%date% %time%] %currentWifi% connected failed) && GOTO startConnect)
IF ERRORLEVEL 0 ((ECHO [%date% %time%] %currentWifi% connected success) && GOTO checkStatus)
PAUSE>NUL
