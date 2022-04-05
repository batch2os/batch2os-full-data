@echo off
@set b2ousername=%1%
if "%b2ousername%"=="" set b2ousername=An error has occurred loading user data
title batch2os
:main
cls
color 3f
echo --Dashboard-----------
echo # 1: Downloaded apps #
echo # 2: Games           #
echo # 3: Utilities       #
echo # 4: Power options   #
echo ----------------------
choice /c 1234 /n
if %ERRORLEVEL%==1 goto 1
if %ERRORLEVEL%==2 goto 2
if %ERRORLEVEL%==3 goto 3
if %ERRORLEVEL%==4 goto 4
:1
cls
color 1f
echo Downloaded apps
cd C:\"Program Files"\batch2os\config\users\
if NOT EXIST "%b2ousername%" goto sus
cd %b2ousername%\apps\
dir/b
echo 1: Back
set/p "option=Enter the name of the app you want to start: "
if %option%==1 goto main
if NOT EXIST %option% goto 1
cd %option%
call main.bat %b2ousername%
exit
:2
cls
color 2f
echo --Games-----------------------
echo # 1: batch2os Education Pack #
echo # 2: Back                    #
echo ------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto 21
if %ERRORLEVEL%==2 goto main
goto main
:21
cls
cd C:\Program Files\batch2os\apps\games\edupack\
call main.bat
exit
:3
cls
color 5f
echo --Utilities---------
echo # 1: App Store     #
echo # 2: Settings      #
echo # 3: Back          #
echo --------------------
choice /c 123 /n
if %ERRORLEVEL%==1 goto 31
if %ERRORLEVEL%==2 goto settings
if %ERRORLEVEL%==3 goto main
goto 3
:31
cls
cd C:\"Program Files"\batch2os\apps\utilities\store
call main.bat %b2ousername%
:settings
cls
echo Starting Settings...
cd C:\"Program Files"\batch2os\apps\config\
call main.bat %b2ousername%
goto 3
:sus
cls
echo Non-fatal Error
echo Your user was not found in batch2os files.
echo This may happen if you have manually opened the dashboard's main.bat file.
echo Press any key to return to batch2os...
pause >nul
goto main
:4
cls
cd C:\Program Files\batch2os\apps\dashboard
call power.bat %b2ousername%