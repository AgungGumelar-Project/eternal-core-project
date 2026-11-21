@echo off
setlocal
chcp 65001 >nul 2>&1
cd /d "%~dp0"
set "AGY_BIN=C:\Users\ASUS\AppData\Local\agy\bin"
echo ";%PATH%;" | findstr /I /L /C:";%AGY_BIN%;" >nul 2>&1 || set "PATH=%AGY_BIN%;%PATH%"
agy.exe --dangerously-skip-permissions %*
