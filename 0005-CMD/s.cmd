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
	
:Install
DISM /Online /Add-Package /PackagePath:"D:\fademind\Downloads\c\windows10.0-kb4557964-x64.cab"
DISM /Online /Add-Package /PackagePath:"D:\fademind\Downloads\c\windows10.0-kb4562830-x64.cab"
DISM /Online /Add-Package /PackagePath:"D:\fademind\Downloads\c\windows10.0-kb4566782-x64.cab"
DISM /Online /Add-Package /PackagePath:"D:\fademind\Downloads\c\windows10.0-kb4570334-x64.cab"
pause
