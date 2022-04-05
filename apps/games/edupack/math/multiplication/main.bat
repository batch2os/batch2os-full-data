@echo off
@set b2ousername=%1%
title batch2os Education Pack - Error
color 2f
:main
cls
echo --Unfinished App----------------------------------
echo # Unfortunately, this app has not been finished. #
echo --------------------------------------------------
pause >nul
cd C:\Program Files\batch2os\apps\dashboard\
call main.bat %b2ousername%
exit