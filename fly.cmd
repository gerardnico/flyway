
@echo off

SET OLD_WK_DIR=%cd%
SET SCRIPT_PATH=%~dp0


cd /D %SCRIPT_PATH%

if .%1 == . (
    echo The operation is mandatory (migrate,...) as first parameter and was not given
    echo Exiting
    exit /B 1
)


flyway -configFiles=%cd%\flyway.conf -locations=filesystem:%cd%\sql %*

REM 
REM flyway ^
REM    -driver=%FLY_DRIVER% ^
REM    -url=%FLY_URL% ^
REM    -user=%FLY_USER% ^
REM    -password=!FLY_PASSWORD! ^
REM    -locations=filesystem:%SCRIPT_PATH%\..\%FLY_LOCATION% ^
REM    %*



cd /D %OLD_WK_DIR%


