@echo off
title Bruteforce Password Cracker - mpck4
color 5
if not exist "C:\Program Files\7-Zip" (
	echo 7-Zip not installed, go to https://www.7-zip.org/download.html to install
	pause
	exit
)

echo.
set /p archive="Enter path to file: "
if not exist "%archive%" (
	echo wrong path or not installed
	pause
	exit
)

set /p wordlist="Enter path to Wordlist: "
if not exist "%wordlist%" (
	echo wrong path or not installed
	pause
	exit
)
echo Cracking...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
echo wordlist did not include the correct password.
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"%USERPROFILE%\Desktop\extracted" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
	echo Success! Password Found: %pass%
	pause
	exit
)