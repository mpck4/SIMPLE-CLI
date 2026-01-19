@echo off
chcp 65001 >nul
title FILE UNLOCKER - mpck4
color 0A
cls

echo [!] Welcome to the unlock terminal.
set /p dir=Enter directory with locked files: 
set /p key=Enter decryption key: 

powershell -ExecutionPolicy Bypass -File decrypt.ps1 "%dir%" "%key%"
echo.
echo [92m[+] Files decrypted (if key was correct).[0m
pause
exit
