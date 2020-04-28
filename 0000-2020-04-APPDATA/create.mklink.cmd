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
	
:MKLINKJOB
set CustAppDir="d:\fademind\AppData"
:: EpicGamesLauncher
MKLINK /D  "%UserProfile%\AppData\Local\EpicGamesLauncher" "%CustAppDir%\Local\EpicGamesLauncher"
:: GOG
MKLINK /D  "%UserProfile%\AppData\Local\GOG.com" "%CustAppDir%\Local\GOG.com"
:: Chrome
MKLINK /D  "%UserProfile%\AppData\Local\Google" "%CustAppDir%\Local\Google"
MKLINK /D  "%UserProfile%\AppData\Local\Mega Limited" "%CustAppDir%\Local\Mega Limited"
MKLINK /D  "%UserProfile%\AppData\Local\Origin" "%CustAppDir%\Local\Origin"
:: Spotify Cache
MKLINK /D  "%UserProfile%\AppData\Local\Spotify" "%CustAppDir%\Local\Spotify"
:: Steam
MKLINK /D  "%UserProfile%\AppData\Local\Steam" "%CustAppDir%\Local\Steam"
:: Ubisoft
MKLINK /D  "%UserProfile%\AppData\Local\Ubisoft Game Launcher" "%CustAppDir%\Local\Ubisoft Game Launcher"
:: cFos
MKLINK /D  "%UserProfile%\AppData\Local\cFos" "%CustAppDir%\Local\cFos"
MKLINK /D  "%UserProfile%\AppData\Local\converseen" "%CustAppDir%\Local\converseen"
MKLINK /D  "%UserProfile%\AppData\Roaming\AIMP" "%CustAppDir%\Roaming\AIMP"
MKLINK /D  "%UserProfile%\AppData\Roaming\Acronis" "%CustAppDir%\Roaming\Acronis"
:: GitHub Desktop
MKLINK /D  "%UserProfile%\AppData\Roaming\GitHub Desktop" "%CustAppDir%\Roaming\GitHub Desktop"
:: Authy
MKLINK /D  "%UserProfile%\AppData\Roaming\Authy Desktop" "%CustAppDir%\Roaming\Authy Desktop"
:: BatteryBar
MKLINK /D  "%UserProfile%\AppData\Roaming\BatteryBar" "%CustAppDir%\Roaming\BatteryBar"
MKLINK /D  "%UserProfile%\AppData\Roaming\Burnaware" "%CustAppDir%\Roaming\Burnaware"
:: IDM
MKLINK /D  "%UserProfile%\AppData\Roaming\IDM" "%CustAppDir%\Roaming\IDM"
MKLINK /D  "%UserProfile%\AppData\Roaming\IrfanView" "%CustAppDir%\Roaming\IrfanView"
MKLINK /D  "%UserProfile%\AppData\Roaming\KC Softwares" "%CustAppDir%\Roaming\KC Softwares"
MKLINK /D  "%UserProfile%\AppData\Roaming\Kodi" "%CustAppDir%\Roaming\Kodi"
MKLINK /D  "%UserProfile%\AppData\Roaming\Notepad++" "%CustAppDir%\Roaming\Notepad++"
MKLINK /D  "%UserProfile%\AppData\Roaming\Origin" "%CustAppDir%\Roaming\Origin"
:: Adguard cannot handle it :: MKLINK /D  "%UserProfile%\AppData\Roaming\Spotify" "%CustAppDir%\Roaming\Spotify"
MKLINK /D  "%UserProfile%\AppData\Roaming\WinRAR" "%CustAppDir%\Roaming\WinRAR"
MKLINK /D  "%UserProfile%\AppData\Roaming\copyq" "%CustAppDir%\Roaming\copyq"
MKLINK /D  "%UserProfile%\AppData\Roaming\picpick" "%CustAppDir%\Roaming\picpick"
MKLINK /D  "%UserProfile%\AppData\Roaming\qBittorrent" "%CustAppDir%\Roaming\qBittorrent"
MKLINK /D  "%UserProfile%\AppData\Roaming\Bitwarden" "%CustAppDir%\Roaming\Bitwarden"
MKLINK /D  "%UserProfile%\AppData\Roaming\discord" "%CustAppDir%\Roaming\discord"
MKLINK /D  "%UserProfile%\AppData\Roaming\vlc" "%CustAppDir%\Roaming\vlc"
MKLINK /D  "%UserProfile%\AppData\Local\Microsoft\Outlook" "%CustAppDir%\Local\Microsoft\Outlook"
:: Edge Chromium
if exist "%UserProfile%\AppData\Local\Microsoft\Edge\" rd /s /q "%UserProfile%\AppData\Local\Microsoft\Edge\"
if not exist "%CustAppDir%\Local\Microsoft\Edge" mkdir "%CustAppDir%\Local\Microsoft\Edge"
MKLINK /D  "%UserProfile%\AppData\Local\Microsoft\Edge" "%CustAppDir%\Local\Microsoft\Edge"
:: Themems
if exist "%UserProfile%\AppData\Local\Microsoft\Windows\Themes" rd /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\Themes"
MKLINK /D  "%UserProfile%\AppData\Local\Microsoft\Windows\Themes" "%CustAppDir%\Local\Microsoft\Windows\Themes"
MKLINK /D  "%UserProfile%\AppData\Local\Chomikbox" "%CustAppDir%\Local\Chomikbox"
:: Firefox
if not exist "%CustAppDir%\Roaming\Mozilla\" mkdir "%CustAppDir%\Roaming\Mozilla\"
if not exist "%CustAppDir%\Local\Mozilla\" mkdir "%CustAppDir%\Local\Mozilla\"
if exist "%UserProfile%\AppData\Roaming\Mozilla\" rd /s /q "%UserProfile%\AppData\Roaming\Mozilla\"
if exist "%UserProfile%\AppData\Local\Mozilla\" rd /s /q "%UserProfile%\AppData\Local\Mozilla\"
MKLINK /D  "%UserProfile%\AppData\Roaming\Mozilla\" "%CustAppDir%\Roaming\Mozilla\"
MKLINK /D  "%UserProfile%\AppData\Local\Mozilla\" "%CustAppDir%\Local\Mozilla\"
:: Thunderbird
if not exist "%CustAppDir%\Roaming\Thunderbird\" mkdir "%CustAppDir%\Roaming\Thunderbird\"
if not exist "%CustAppDir%\Local\Thunderbird\" mkdir "%CustAppDir%\Local\Thunderbird\"
if exist "%UserProfile%\AppData\Roaming\Thunderbird\" rd /s /q "%UserProfile%\AppData\Roaming\Thunderbird\"
if exist "%UserProfile%\AppData\Local\Thunderbird\" rd /s /q "%UserProfile%\AppData\Local\Thunderbird\"
MKLINK /D  "%UserProfile%\AppData\Roaming\Thunderbird\" "%CustAppDir%\Roaming\Thunderbird\"
MKLINK /D  "%UserProfile%\AppData\Local\Thunderbird\" "%CustAppDir%\Local\Thunderbird\"
pause
