@echo off

@REM Sign code from CrossOver/WINE via osslsigncode in wine.

@REM USAGE: osslsigncode.bat <PASSWORD> <CERT_LOCATION> <URL> <FILE>

set PASSWORD=%~1
set CERT_LOCATION=%~2
set URL=%~3

@REM Get unix path for input file.
for /f "usebackq tokens=* " %%i in (`winepath -u %~4`) do set FILE=%%i

@REM Temporary output file. Inline signing does not work.
set SIGNED=%FILE%.signed

@REM Delete existing temporary output file.
del /f "%SIGNED%" > nul 2>&1

@REM Get unix path for project directory.
for /f "usebackq tokens=* " %%i in (`winepath -u %~dp0`) do set PROJECT_DIR=%%i

Z:\opt\osslsigncode\osslsigncode.exe sign -pkcs12 "%CERT_LOCATION%" -pass "%PASSWORD%" -i "%URL%" -t http://timestamp.digicert.com -in "%FILE%" -out "%SIGNED%"

@REM Replace input file with signed output file.
echo Yes | move /-Y "%SIGNED%" "%FILE%"