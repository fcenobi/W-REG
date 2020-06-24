:: Created by: Shawn Brink
:: Created on: August 15th 2016
:: Updated on: July 25th 2018
:: Tutorial: https://www.tenforums.com/tutorials/16588-clear-all-event-logs-event-viewer-windows.html


@echo off
:: Check if we are administrator. If not, exit immediately.
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
 
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
 
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"
 
   "%temp%\getadmin.vbs"
   del "%temp%\getadmin.vbs"
   exit /B
 
:gotAdmin
   pushd "%CD%"
   CD /D "%~dp0"

:set_rule
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.
echo All Event Logs have been cleared!
goto theEnd

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:noAdmin
echo Current user permissions to execute this .BAT file are inadequate.
echo This .BAT file must be run with administrative privileges.
echo Exit now, right click on this .BAT file, and select "Run as administrator".  
pause >nul

:theEnd
Exit