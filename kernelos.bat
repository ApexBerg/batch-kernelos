:::::::::::::::::::::::::::::::::::::::
::            MIT LICENSED           ::
::           by NotInfinity          ::
::          aka Matthew Adams        ::
::           Kernel OS v1.0          ::
:::::::::::::::::::::::::::::::::::::::
:: SCROLL DOWN ::
:::::::::::::::::




















@echo off
title Kernel OS
cls









:::::::::::::::
:: Var Start ::
:::::::::::::::

set "build=1.0.0"
set "osbuild=2022"
set "codename=Nite"
set excom=null

::::::::::::::
:: Var End  ::
::::::::::::::







:pgosnew
color 0f
cls
echo.
type data\playtxt.txt
echo.
echo.
echo.
echo.
echo Checking Files
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

echo System Path: %cd%
ping localhost -n 3 >nul
goto login

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
echo what failed: %excom%
echo stopcode: %stopcode%
ping localhost -n 8 >nul
echo Automatic Repair is in progress do not interrupt!
call sysfail/recovery.bat

:login
cls
echo.
type data\playtxt.txt                          
echo.
echo.
echo Login / Register
echo.
echo [1] Login
echo [2] Register
choice /c 12 /n
if %errorlevel% == 1 goto login1
if %errorlevel% == 2 goto regis
goto login

:regis
cls
echo.
type data\playtxt.txt
echo.
echo.
echo.
set /p pass2=Password: 
echo %pass2% > password.ini

:login1
cls
echo.
type data\playtxt.txt                     
echo.
echo.
echo.
set /p pass1= Password: 
for /f "Delims=" %%a in (password.ini) do (

set TEXT=%%a

)

if %pass1%==%text% goto pgos3
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

:pgos3
msg "%username%" open KEY.txt to get a license key
cls
echo.
type data\playtxt.txt
echo.
echo.
echo.
set /p license= License Key: 
if %license% == 8585-3528-2984-3963 goto pgos
if %license% == 26732-29127-14006-30358 goto pgos
if %license% == 13789-14981-26500-26706 goto pgos
if %license% == 25715-29347-1483-729 goto pgos
if %license% == 22794-23451-15598-13458 goto pgos
goto pgos3


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
msg "%username%" welcome to kernel os
title Kernel OS
cls
echo.
type data\playtxt.txt
echo.
echo.
echo.
echo Current date: %date%
echo Current time: %time%
echo.
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == draw call data\draw\draw.bat
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == systeminfo goto sysinfo
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
title Kernel OS
echo Showing Commands
echo.
echo help - shows all commands
echo timer - starts a timer
echo time - shows current time
echo date - shows current date
echo calculator - math
echo draw - basically paint.exe
echo.
echo controlpanel - unspecified
echo slfdestruct - destroy os
echo systeminfo - shows information about the system
echo vol - displays a disk volume label and serial number
echo ver - shows os info
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
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
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == vol goto vol
if %terminal% == timer goto timer
if %terminal% == draw call data\draw\draw.bat
if %terminal% == systeminfo goto sysinfo
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
echo (C) Not Company. All rights not reserved.
echo.
echo This product is licensed to:
echo %USERNAME%
echo.
echo Your License Key:
echo %license%
echo.
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == date goto date
if %terminal% == vol goto vol
if %terminal% == draw call data\draw\draw.bat
if %terminal% == calculator goto calc
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
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == vol goto vol
if %terminal% == timer goto timer
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
echo [%date%] Kernel OS has ran a problem with system.exe stopcode: SLF_DESTRUCT_INTIATED >> logs\logs.txt
color c
sound play sounds\bsod.wav
echo.
echo :(
echo.
echo Your device ran into a problem
echo We're just collecting some error
echo info, and then we'll launch
echo automatic repair for you.
echo.
echo what failed: system
echo stopcode: SLF_DESTRUCT_INTIATED
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
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
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
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
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
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == systeminfo goto sysinfo
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == time goto time
if %terminal% == vol goto vol
if %terminal% == draw call data\draw\draw.bat
if %terminal% == date goto date
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
set /p terminal=root@kernelos:~$ 
if %terminal% == notepad call nano.exe
if %terminal% == help goto help
if %terminal% == timer goto timer
if %terminal% == systeminfo goto sysinfo
if %terminal% == time goto time
if %terminal% == draw call data\draw\draw.bat
if %terminal% == vol goto vol
if %terminal% == date goto date
if %terminal% == calculator goto calc
if %terminal% == controlpanel goto pgos1
if %terminal% == slfdestruct goto bsod1
if %terminal% == ver goto ver
goto vol