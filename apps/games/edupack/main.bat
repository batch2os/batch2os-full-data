@echo off
@set b2ousername=%1%
cls
color cf
title batch2os Education Pack
:main
cls
echo --Education Pack---------
echo # 1: Math stuff         #
echo # 2: Go back            #
echo -------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto math
if %ERRORLEVEL%==2 goto return
goto main
:math
cls
cd C:\Program Files\batch2os\apps\games\edupack\math\
call main.bat %b2ousername%
exit
:return
cls
cd C:\Program Files\batch2os\apps\dashboard\
call main.bat %b2ousername
exit