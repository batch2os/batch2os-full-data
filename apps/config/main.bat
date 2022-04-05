@echo off
@set b2ousername=%1%
title batch2os
color 8f
:main
cls
echo --Settings------------
echo # 1: Data Management #
echo # 2: Users           #
echo # 3: System          #
echo # 4: Back            #
echo ----------------------
choice /c 1234 /n
if %ERRORLEVEL%==1 goto data-management
if %ERRORLEVEL%==2 goto user-management
if %ERRORLEVEL%==3 goto system-management
if %ERRORLEVEL%==4 goto main2
goto main
:data-management
cls
echo --Data Management---------
echo # 1: Manage applications #
echo # 2: Back                #
echo --------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto manage-applications
if %ERRORLEVEL%==2 goto main
goto data-management
:user-management
cls
echo Starting User Management...
cd C:\"Program Files"\batch2os\apps\config\users\
call main.bat %b2ousername%
goto main
:system-management
cls
color 8f
echo --System-----------------
echo # 1: System Transfer    #
echo # 2: Backup and Restore #
echo # 3: Initialize         #
echo # 4: Troubleshooting    #
echo # 5: System Update      #
echo # 6: Back               #
echo -------------------------
choice /c 123456 /n
if %ERRORLEVEL%==1 goto system-transfer
if %ERRORLEVEL%==2 goto backup-and-restore
if %ERRORLEVEL%==3 goto initialize
if %ERRORLEVEL%==4 goto troubleshooting
if %ERRORLEVEL%==5 goto update
if %ERRORLEVEL%==6 goto main
goto system-management
:system-transfer
cls
echo Please wait...
cd C:\"Program Files"\batch2os\apps\config\transfer\
call main.bat %b2ousername%
goto system-management
:backup-and-restore
cls
echo Please wait...
cd C:\"Program Files"\batch2os\apps\config\backup-and-restore\
call main.bat %b2ousername%
goto system-management
:initialize
cls
color 04
echo --Initialize----------------------------------------------------------------------------
echo # Initializing will erase EVERYTHING on your system.                                   #
echo # Are you REALLY sure you want to initialize?                                          #
echo # If you are sure you want to initialize type the phrase                               #
echo # "I am 100 percent sure I want to initialize." into the field indicated by the arrow. #
echo # Otherwise type anything else.                                                        #
echo ----------------------------------------------------------------------------------------
echo.
set/p "option=-->"
if "%option%"=="I am 100 percent sure I want to initialize." goto initialize2
goto system-management
:troubleshooting
cls
echo --Troubleshooting---------------------
echo # Error code 1: Program not finished #
echo --------------------------------------
pause
goto system-management
:initialize2
cls
echo Initializing...
cd C:\"Program Files"\batch2os\
rmdir config /s /q
mkdir config
mkdir config\users\
cls
echo --Initialize------------------------------
echo # Completed. Press any key to restart... #
echo ------------------------------------------
pause >nul
cd C:\"Program Files"\batch2os\
call bootloader.bat
exit
:main2
cls
call C:\"Program Files"\batch2os\apps\dashboard\main.bat %b2ousername%
exit