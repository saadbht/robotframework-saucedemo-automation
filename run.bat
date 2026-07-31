@echo off
REM run.bat  or  run.bat firefox
set BROWSER=%1
if "%BROWSER%"=="" set BROWSER=chrome
robot --variable BROWSER:%BROWSER% --outputdir results tests/purchase_flow.robot
