@echo off
title SimpleCLI - mpck4
chcp 65001 >nul
cd ..
color 5
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo [38;2;140;180;230m     ╔═(1) SMB Brute Force[0m  
echo [38;2;120;185;225m     ║[0m  
echo [38;2;100;190;220m     ╠══(2) Password Bruteforce[0m  
echo [38;2;80;195;215m     ║[0m  
echo [38;2;60;200;210m     ╠═══(3) Geolocate[0m  
echo [38;2;50;202;208m     ║[0m  
echo [38;2;60;200;210m     ╠═══(4) File Locker[0m  
echo [38;2;50;202;208m     ║[0m  
echo [38;2;60;200;210m     ╠═══(5) File Decrypter[0m  
echo [38;2;50;202;208m     ║[0m  
echo [38;2;40;205;205m     ╠═══(6) Wireshark[0m  
echo [38;2;30;208;202m     ║[0m 
echo [38;2;20;210;200m     ╠═══(7) Nmap[0m  
echo [38;2;10;212;198m     ║[0m 
echo [38;2;0;215;195m     ╚╦═══(8) exit[0m  
echo [38;2;0;218;192m      ║[0m  
set /p input=.%BS% [38;2;0;221;189m     ╚══════^>[0m  

if /I %input% EQU 1 start bruteforce.bat
if /I %input% EQU 2 start BFpassCracker.bat
if /I %input% EQU 3 start geocate.lnk
if /I %input# EQU 4 start encrypt.bat
if /I %input# EQU 5 start decrypt.bat
if /I %input% EQU 6 start C:\Program Files\Wireshark\Wireshark.exe
if /I %input% EQU 7 start C:\Program Files\Nmap\Nmap.exe
if /I %input% EQU 8 exit
cls
goto start

:banner
echo.
echo [38;2;220;145;260m-------------------------------------------------------------------------------[0m
echo [38;2;200;150;255m _______  ___   __   __  _______  ___      _______         _______  ___      ___  [0m
echo [38;2;180;155;250m^|       ^|^|   ^| ^|  ^|_^|  ^|^|       ^|^|   ^|    ^|       ^|       ^|       ^|^|   ^|    ^|   ^| [0m
echo [38;2;160;165;245m^|  _____^|^|   ^| ^|       ^|^|    _  ^|^|   ^|    ^|    ___^| ____  ^|       ^|^|   ^|    ^|   ^| [0m
echo [38;2;140;175;240m^| ^|_____ ^|   ^| ^|       ^|^|   ^|_^| ^|^|   ^|    ^|   ^|___ ^|____^| ^|       ^|^|   ^|    ^|   ^| [0m
echo [38;2;120;185;235m^|_____  ^|^|   ^| ^|       ^|^|    ___^|^|   ^|___ ^|    ___^|       ^|      _^|^|   ^|___ ^|   ^| [0m
echo [38;2;100;192;225m _____^| ^|^|   ^| ^| ^|^|_^|^| ^|^|   ^|    ^|       ^|^|   ^|___        ^|     ^|_ ^|       ^|^|   ^| [0m
echo [38;2;70;200;215m^|_______^|^|___^| ^|_^|   ^|_^|^|___^|    ^|_______^|^|_______^|       ^|_______^|^|_______^|^|___^| [0m
::echo [38;2;40;205;205m [0m
::echo [38;2;0;210;200m [0m
echo [38;2;0;210;195m-------------------------------------------------------------------------------[0m
echo.
