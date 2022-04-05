@echo off
@set b2ousername=%1%
cls
title batch2os - App Store
color f3
:main
cls
color f3
echo --App Store------------
echo # 1: Install an app   #
echo # 2: Uninstall an app #
echo # 3: Settings         #
echo # 4: Exit             #
echo -----------------------
choice /c 1234 /n
if %ERRORLEVEL%==1 goto install
if %ERRORLEVEL%==2 goto uninstall
if %ERRORLEVEL%==3 goto settings
if %ERRORLEVEL%==4 goto exit
goto main
:install
cls
echo --Install--------------------
echo # 1: Games                  #
echo # 2: Utilities              #
echo # 3: Install app using name #
echo # 4: Back                   #
echo #  : Install app from file  #
echo -----------------------------
choice /c 1234 /n 
if %ERRORLEVEL%==1 goto installgames
if %ERRORLEVEL%==2 goto installutils
if %ERRORLEVEL%==3 goto installusingname
if %ERRORLEVEL%==4 goto main
:installgames
cls
color f1
echo Install a game
echo.
cd C:\Program Files\batch2os\apps\utilities\store\database\games\
dir /b
echo.
echo 1: Back
set/p "option=Enter the name of the game you want to install: "
if "%option%"=="1" goto install
if NOT EXIST %option% goto installgames
goto install-game
:installutils
cls
color f1
echo Install a utility
echo.
cd C:\Program Files\batch2os\apps\utilities\store\database\utils\
dir /b
echo.
echo 1: Back
set/p "option=Enter the name of the utility you want to install: "
if "%option%"=="1" goto install
if NOT EXIST %option% goto installutils
goto install-util
:installusingname
cls
echo This feature is not yet supported.
pause
goto install
:install-game
cls
echo Install game "%option%"
echo Are you sure you want to install this game?
echo 1: Yes, install it
echo 2: No
choice /c 12 /n
if %ERRORLEVEL%==1 goto install-game2
if %ERRORLEVEL%==2 goto install
goto install-game
:install-game2
cls
echo Running install script...
cd C:\Program Files\batch2os\apps\utilities\store\database\games\"%option%"
call clone.bat %b2ousername%
goto install
:install-util
cls
echo Install utility "%option%"
echo Are you sure you want to install this utility?
echo 1: Yes, install it
echo 2: No
choice /c 12 /n
if %ERRORLEVEL%==1 goto install-util2
if %ERRORLEVEL%==2 goto install
goto install-util
:install-util2
cls
echo Running install script...
cd C:\Program Files\batch2os\apps\utilities\store\database\utils\"%option%"
call clone.bat %b2ousername%
goto install
:uninstall
cls
color f1
cd C:\Program Files\batch2os\config\users\%b2ousername%\apps\
echo Uninstall an app
echo. 
dir/b
echo.
echo 1: Back
set/p "option=Enter the name of the app you want to uninstall: "
if "%option%"=="1" goto main 
if NOT EXIST "%option%" goto uninstall
goto uninstall2
:uninstall2
cls
rmdir "%option%" /s /q
echo Uninstalled "%option%".
timeout /t 3 >nul
goto main
:settings
cls
color 83
echo --Settings----------------
echo # 1: Update the database #
echo # 2: Back                #
echo --------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto update-database
if %ERRORLEVEL%==2 goto main
goto settings
:update-database
cls
echo --Update database---------------------------------------------------------
echo # Updating database from "github.com/batch2os/batch2os-appstore-repo"... #
echo --------------------------------------------------------------------------
echo.
echo --Log--
cd %temp%
if EXIST batch2os rmdir batch2os /s /q
mkdir batch2os
cd batch2os
git clone github.com/batch2os/batch2os-appstore-repo
cd batch2os-appstore-repo
rmdir .git /s /q
del README.md
if NOT EXIST games goto update-database-fail
if NOT EXIST utils goto update-database-fail
rmdir C:\Program Files\batch2os\apps\utilities\store\database\games /s /q
rmdir C:\Program Files\batch2os\apps\utilities\store\database\utils /s /q
xcopy games C:\Program Files\batch2os\apps\utilities\store\database\
xcopy utils C:\Program Files\batch2os\apps\utilities\store\database\
cd ..\..\
rmdir batch2os /s /q
cls
echo --Update database------------
echo # Database update complete! #
echo -----------------------------
timeout /t 3 >nul
goto settings
:update-database-fail
cls
color f4
echo --Database update failed!-------------------------------
echo # An error occurred while updating the Store Database. #
echo --------------------------------------------------------
timeout /t 3 >nul
goto settings
:exit
cls
cd C:\Program Files\batch2os\apps\dashboard\
call main.bat %b2ousername%
exit