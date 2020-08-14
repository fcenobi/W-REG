@ECHO OFF

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

GOTO :TASKKILL

:TASKKILL
taskkill /f /im OneDrive.exe

	GOTO :UNINSTALL

:UNINSTALL
%SystemRoot%\SysWOW64\OneDriveSetup.exe/ uninstall

	GOTO :EXPLORERCLEAN

:EXPLORERCLEAN
	reg add HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /t REG_DWORD /v System.IsPinnedToNameSpaceTree /d 0 /f
	reg add HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /t REG_DWORD /v System.IsPinnedToNameSpaceTree /d 0 /f

	GOTO :END

:END
