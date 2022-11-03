rem open the firewall ports
@echo off

rem ports need to be open
set ALL_PORTS=8384


rem opening ports
FOR %%p in (%ALL_PORTS%) do (
    SET PORT=%%p
	echo try to open %%p
    call :input
    call :output        
)

pause

rem in rules
:input
set INPUTPORT=%PORT%
set INPUT_RULE_NAME="_%INPUTPORT% in"
netsh advfirewall firewall show rule name=%INPUT_RULE_NAME% >nul
if not ERRORLEVEL 1 (
    echo sorry, rule %INPUT_RULE_NAME% exists
) else (
    netsh advfirewall firewall add rule name=%INPUT_RULE_NAME% dir=in action=allow protocol=TCP localport=%INPUTPORT%
    echo create rule %INPUT_RULE_NAME% success
) 

rem out rules
:output
set OUTPORT=%PORT%
set OUT_RULE_NAME="_%OUTPORT% out"
netsh advfirewall firewall show rule name=%OUT_RULE_NAME% >nul
if not ERRORLEVEL 1 (
    echo sorry, rule %OUT_RULE_NAME% exists
) else (
    netsh advfirewall firewall add rule name=%OUT_RULE_NAME% dir=out action=allow protocol=TCP localport=%OUTPORT%
    echo create rule %OUT_RULE_NAME% success
)