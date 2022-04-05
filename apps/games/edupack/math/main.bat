@echo off
@set b2ousername=%1%
cls
title batch2os Education Pack - Math
:main
cls
echo --Math---------------
echo # 1: Addition       #
echo # 2: Subtraction    #
echo # 3: Multiplication #
echo # 4: Division       #
echo # 5: Back           #
echo ---------------------
choice /c 12345 /n
if %ERRORLEVEL%==1 goto add
if %ERRORLEVEL%==2 goto subtr
if %ERRORLEVEL%==3 goto multi
if %ERRORLEVEL%==4 goto div
if %ERRORLEVEL%==5 goto back
goto main
:add
cls
cd C:\Program Files\batch2os\apps\games\edupack\math\addition\
call main.bat %b2ousername%
exit
:subtr
cls
cd C:\Program Files\batch2os\apps\games\edupack\math\subtraction\
call main.bat %b2ousername%
exit
:multi
cls
cd C:\Program Files\batch2os\apps\games\edupack\math\multiplication\
call main.bat %b2ousername%
exit
:div
cls
cd C:\Program Files\batch2os\apps\games\edupack\math\division\
call main.bat %b2ousername%
exit
:back
cls
cd C:\Program Files\batch2os\apps\games\edupack\
call main.bat %b2ousername%
exit