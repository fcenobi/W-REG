:: Created by: Shawn Brink
:: Created on: June 26th 2016
:: Tutorial: http://www.tenforums.com/tutorials/54452-font-cache-rebuild-windows-10-a.html

@echo OFF
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
	
:: Stop and disable "Windows Font Cache Service" service
:FontCache
sc stop "FontCache"
sc config "FontCache" start=disabled
sc query FontCache | findstr /I /C:"STOPPED" 
if not %errorlevel%==0 (goto FontCache)


:: Grant access rights to current user for "%WinDir%\ServiceProfiles\LocalService" folder and contents
icacls "%WinDir%\ServiceProfiles\LocalService" /grant "%UserName%":F /C /T /Q


:: Delete font cache
del /A /F /Q "%WinDir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*FontCache*"

del /A /F /Q "%WinDir%\System32\FNTCACHE.DAT"


:: Enable and start "Windows Font Cache Service" service
sc config "FontCache" start=auto
sc start "FontCache"
@PAUSE
