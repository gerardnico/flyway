
@echo off

SET OLD_WK_DIR=%cd%
SET SCRIPT_PATH=%~dp0


cd /D %SCRIPT_PATH%


flyway -configFiles=%cd%\flyway.conf %*

cd /D %OLD_WK_DIR%


