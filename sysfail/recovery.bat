@echo off
title Kernel OS Recovery
echo [INFO] Recovering files
ping localhost -n 2 >nul
xcopy sysfail\nano.exe /f

xcopy sysfail\nircmd.exe /f

xcopy sysfail\sound.exe /f

xcopy sysfail\cmdmenusel.exe /f

xcopy sysfail\sounds\alarm.wav sounds\ /f

xcopy sysfail\sounds\bsod.wav sounds\ /f

xcopy sysfail\sounds\Ding.wav sounds\ /f
echo [INFO] Done.
ping localhost -n 2 >nul
echo [INFO] Press any key to enter Kernel OS
pause >nul
call kernelos.bat