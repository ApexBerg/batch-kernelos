:::::::::::::::::::::::::::::::::::::::
::            MIT LICENSED           ::
::           by NotInfinity          ::
::          aka Matthew Adams        ::
::           Kernel OS v1.1          ::
:::::::::::::::::::::::::::::::::::::::
:: SCROLL DOWN ::
:::::::::::::::::




















@echo off
title Kernel OS
cls









:::::::::::::::
:: Var Start ::
:::::::::::::::

set "build=1.1.0"
set "osbuild=2022"
set "codename=Nite2"
set excom=null

::::::::::::::
:: Var End  ::
::::::::::::::

:::::::::::::::::::
:: winver detect ::
:::::::::::::::::::

ver | find /i "Windows 2000" >nul
if %errorlevel% == 0 set winver=Windows_2000

ver | find /i "XP" > nul
if %errorlevel% == 0 set winver=Windows_XP

ver | find /i "version 6.0." >nul
if %errorlevel% == 0 set winver=Windows_Vista

ver | find /i "version 6.1." >nul
if %errorlevel% == 0 set winver=Windows_7

ver | find /i "version 6.2." >nul
if %errorlevel% == 0 set winver=Windows_8

ver | find /i "version 6.3." >nul
if %errorlevel% == 0 set winver=Windows_8.1

ver | find /i "version 10.0." >nul
if %errorlevel% == 0 set winver=Windows_10

ver | find /i "version 10.0.22000.739" >nul
if %errorlevel% == 0 set winver=Windows_11

if %winver%==Windows_XP goto :notsupportwin
if %winver%==Windows_2000 goto :notsupportwin

if %winver%==Windows_Vista set txtwinver=Windows Vista & goto pgosnew
if %winver%==Windows_8.1 set txtwinver=Windows 8.1 & goto pgosnew
if %winver%==Windows_8 set txtwinver=Windows 8 & goto pgosnew
if %winver%==Windows_7 set txtwinver=Windows 7 & goto pgosnew
if %winver%==Windows_10 set txtwinver=Windows 10 & goto pgosnew
if %winver%==Windows_11 set txtwinver=Windows 11 & goto pgosnew

:notsupportwin
cls
type data\playtxt.txt
echo.
echo.
echo.
echo Sorry your current windows version [%txtwinver%] is not compatible at the moment
echo.
echo [PRESS ANY KEY TO EXIT]
pause >nul
exit



:::::::::::::::::::::::
:: winver detect end ::
:::::::::::::::::::::::







:pgosnew
color 0f
cls
echo.
type data\playtxt.txt
echo.
echo.
echo.
echo.
echo Checking Russian Federation's Files
msg "%username%" on the first time booting you will get bsod do not exit!
ping localhost -n 2 >nul
if not exist nano.exe==set excom=nano.exe & set stopcode=0x01 & goto BSOD

if not exist nircmd.exe==set excom=nircmd.exe & set stopcode=0x02 & goto BSOD

if not exist sound.exe==set excom=sound.exe & set stopcode=0x03 & goto BSOD

if not exist cmdmenusel.exe==set excom=cmdmenusel.exe & set stopcode=0x04 & goto BSOD

if not exist sound.exe==set excom=sound.exe & set stopcode=0x05 & goto BSOD

if not exist sounds\Ding.wav==set excom=Ding.wav & set stopcode=0x06 & goto BSOD

if not exist sounds\bsod.wav==set excom=bsod.wav & set stopcode=0x07 & goto BSOD

if not exist sounds\alarm.wav==set excom=alarm.wav & set stopcode=0x08 & goto BSOD

echo Path: %cd%
ping localhost -n 3 >nul
if not exist password.ini==set exc=denied & goto regis
if exist password.ini==set exc=pass & goto login1

:BSOD
cls
color c
echo %date% Kernel OS has ran a problem with %excom% >> logs\logs.txt
sound play sounds\bsod.wav
echo.
echo :(
echo.
echo Your device ran into a problem
echo We're just collecting some error
echo info, and then we'll launch
echo automatic repair for you.
echo.
echo the bsod log has been saved at logs\logs.txt
echo.
echo what failed: %excom%
echo stopcode: %stopcode%
ping localhost -n 8 >nul
cls
echo Automatic Repair is in progress do not interrupt!
call sysfail/recovery.bat

:regis
cls
echo.
type data\playtxt.txt
echo.
echo.
echo.
echo register.
set /p pass2=Russia Federation's Password: 
echo %pass2% > password.ini

:login1
cls
echo.
type data\playtxt.txt                     
echo.
echo.
echo.
echo login.
set /p pass1=Russia Federation's Password: 
for /f "Delims=" %%a in (password.ini) do (

set TEXT=%%a

)

if %pass1%==%text% goto pgos
goto login2

:login2
cls
echo Incorrect Password
echo.
type data\playtxt.txt                      
echo.
echo.
echo.
set /p pass2= Password:

for /f "Delims=" %%a in (password.ini) do (

set TEXT=%%a

)
if %pass2%==%text% goto pgos3
goto login2


:pgos1
cls
echo Select Menu:
cmdMenuSel f8%f0 "Continue to OS" "Sound Settings" "Apps" "Exit OS"
if %errorlevel% == 1 goto pgos
if %errorlevel% == 2 goto sndset
if %errorlevel% == 3 goto apps
if %errorlevel% == 4 call data\shutdown.bat
goto pgos1


:pgos
title Kernel OS
cls
echo.
type data\playtxt.txt
echo.
echo.
echo Hello boss this is our current military personnel
echo Active 1,000,000 personnel
echo Reserve 2,000,000 personnel
echo.
echo Current date: %date%
echo Current time: %time%
echo.
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == draw call data\draw\draw.bat
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == systeminfo goto sysinfo
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == vol goto vol
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto pgos


:sndset
cls
echo Volume (in %%) :
cmdMenuSel f8%f0 "Go back" "100" "90" "80" "70" "60" "50" "40" "30" "20" "10" "0"
if %ERRORLEVEL% == 1 goto pgos1
if %ERRORLEVEL% == 2 nircmd setsysvolume 65535 & sound play sounds\ding.wav
if %ERRORLEVEL% == 3 nircmd setsysvolume 58982 & sound play sounds\ding.wav
if %ERRORLEVEL% == 4 nircmd setsysvolume 52429 & sound play sounds\ding.wav
if %ERRORLEVEL% == 5 nircmd setsysvolume 45876 & sound play sounds\ding.wav
if %ERRORLEVEL% == 6 nircmd setsysvolume 39323 & sound play sounds\ding.wav
if %ERRORLEVEL% == 7 nircmd setsysvolume 32770 & sound play sounds\ding.wav
if %ERRORLEVEL% == 8 nircmd setsysvolume 26217 & sound play sounds\ding.wav
if %ERRORLEVEL% == 9 nircmd setsysvolume 19664 & sound play sounds\ding.wav
if %ERRORLEVEL% == 10 nircmd setsysvolume 13111 & sound play sounds\ding.wav
if %ERRORLEVEL% == 11 nircmd setsysvolume 6558 & sound play sounds\ding.wav
if %ERRORLEVEL% == 12 nircmd setsysvolume 1 & sound play sounds\ding.wav
goto sndset

:help
title Kernel OS unhappy russia
echo Showing Commands
echo.
echo help - shows all commands
echo timer - starts a timer
echo time - shows current time
echo date - shows current date
echo calculator - math
echo draw - basically paint.exe
echo.
echo ! danger area !
echo.
echo destroyua - destroy ukraine using our military
echo sendnukeua - destroy ukraine using nukes
echo.
echo ! danger area !
echo.
echo controlpanel - unspecified
echo slfdestruct - destroy os
echo systeminfo - shows information about the system
echo vol - displays a disk volume label and serial number
echo ver - shows os info
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == systeminfo goto sysinfo
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == draw call data\draw\draw.bat
if %terminal% == date goto date
if %terminal% == vol goto vol
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto help

:timer
title Kernel OS
echo Type a number between 1 - INF to begin the timer
:1
set /p timer2=
echo Press any key to start timer
pause >nul
timeout %timer2%
echo Playing alarm sound
sound play sounds\alarm.wav
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == vol goto vol
if %terminal% == timer goto timer
if %terminal% == draw call data\draw\draw.bat
if %terminal% == systeminfo goto sysinfo
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == time goto time
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto timer

:ver
title Kernel OS
echo.
echo.
echo Kernel OS
echo Version %build% (OS Build %osbuild%)
echo Codename: %codename%
echo Copyright (c) 2022 Matthew Adams
echo.
echo This product is licensed to:
echo %USERNAME%
echo.
echo.
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == date goto date
if %terminal% == vol goto vol
if %terminal% == draw call data\draw\draw.bat
if %terminal% == calculator goto calc
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == controlpanel goto pgos1
if %terminal% == systeminfo goto sysinfo
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto ver

:calc
title Kernel OS
set /p MATH=root@playground:~/Math$  
set /a result=%MATH%
echo Result: %result%
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == vol goto vol
if %terminal% == timer goto timer
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == time goto time
if %terminal% == draw call data\draw\draw.bat
if %terminal% == systeminfo goto sysinfo
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto calc

:bsod1
cls
echo %date% Kernel OS has ran a problem with system.exe stopcode: N/A >> logs\logs.txt
color c
sound play sounds\bsod.wav
echo.
echo :(
echo.
echo Russia Federation server has ran into a problem
echo We're just collecting some error
echo info, and then we'll launch
echo automatic repair for you.
echo.
echo bsod log has been saved at logs\logs.txt
echo.
echo what failed: terminal.exe
echo stopcode: N/A
echo.
ping localhost -n 8 >nul
echo Exiting
ping localhost -n 3 >nul
exit

:apps
title Kernel OS
cls
echo Available Apps:
echo nano.exe - notepad
echo sound.exe - plays sound (cant play music yet)
echo cmdmenusel.exe - unspecified
echo nircmd.exe - another cmd with advanced options maybe?
echo.
cmdMenuSel f8%f0 "Go back"
if %errorlevel% == 1 goto pgos1
goto apps

:time
title Kernel OS
echo Current time: %time%
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == date goto date
if %terminal% == draw call data\draw\draw.bat
if %terminal% == calculator goto calc
if %terminal% == vol goto vol
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto time

:date
title Kernel OS
echo Current date: %date%
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
if %terminal% == vol goto vol
if %terminal% == draw call data\draw\draw.bat
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto date

:vol
title Kernel OS
vol
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == systeminfo goto sysinfo
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == vol goto vol
if %terminal% == draw call data\draw\draw.bat
if %terminal% == date goto date
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto vol

:sysinfo
title Kernel OS
systeminfo | findstr /C:"Total Physical Memory"
systeminfo | findstr /C:"Available Physical Memory"
echo.
systeminfo | findstr /C:"BIOS Version"
echo Kernel OS Directory:       %cd%
systeminfo | findstr /C:"System Manufacturer"
systeminfo | findstr /C:"System Model"
systeminfo | findstr /C:"System Type"
systeminfo | findstr /C:"Processor"
echo System Directory:          %cd%\data
systeminfo | findstr /C:"Boot Device"
systeminfo | findstr /C:"System Locale"
systeminfo | findstr /C:"Input Locale"
systeminfo | findstr /C:"Time Zone"
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
if %terminal% == draw call data\draw\draw.bat
if %terminal% == vol goto vol
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto vol

:desua
echo Capital can be anything
set /p capital=Capital: 
echo Destroying %capital% on UKRAINE with %random% personnel
ping localhost -n 8 > nul
echo UKRAINE Lost we won.
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
if %terminal% == draw call data\draw\draw.bat
if %terminal% == vol goto vol
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto desua

:sndnukeua
echo Capital can be anything.
set /p capital=Capital: 
set /a num=%rndnum% %%100 +1
echo Destroying %capital% on UKRAINE with %rndnum% nukes
ping localhost -n 6 > nul
echo UKRAINE Lost we won.
set /p terminal=russia@federation:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
if %terminal% == draw call data\draw\draw.bat
if %terminal% == vol goto vol
if %terminal% == destroyua goto desua
if %terminal% == sendnukeua goto sndnukeua
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto sndnukeua