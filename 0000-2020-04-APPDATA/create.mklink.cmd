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
:: rd /s /q "%UserProfile%\AppData\Local\EpicGamesLauncher"
:: MKLINK /D  "%UserProfile%\AppData\Local\EpicGamesLauncher" "%CustAppDir%\Local\EpicGamesLauncher"
:: GOG
:: rd /s /q "%UserProfile%\AppData\Local\GOG.com"
:: MKLINK /D  "%UserProfile%\AppData\Local\GOG.com" "%CustAppDir%\Local\GOG.com"
:: Chrome
:: MKLINK /D  "%UserProfile%\AppData\Local\Google" "%CustAppDir%\Local\Google"
:: MEGA
rd /s /q "%UserProfile%\AppData\Local\Mega Limited"
MKLINK /D  "%UserProfile%\AppData\Local\Mega Limited" "%CustAppDir%\Local\Mega Limited"
:: Origin
rd /s /q "%UserProfile%\AppData\Local\Origin"
MKLINK /D  "%UserProfile%\AppData\Local\Origin" "%CustAppDir%\Local\Origin"
rd /s /q "%UserProfile%\AppData\Roaming\Origin"
MKLINK /D  "%UserProfile%\AppData\Roaming\Origin" "%CustAppDir%\Roaming\Origin"
:: Spotify Cache
:: MKLINK /D  "%UserProfile%\AppData\Local\Spotify" "%CustAppDir%\Local\Spotify"
:: Steam
:: rd /s /q "%UserProfile%\AppData\Local\Steam"
:: MKLINK /D  "%UserProfile%\AppData\Local\Steam" "%CustAppDir%\Local\Steam"
:: Ubisoft
:: rd /s /q "%UserProfile%\AppData\Local\Ubisoft Game Launcher"
:: MKLINK /D  "%UserProfile%\AppData\Local\Ubisoft Game Launcher" "%CustAppDir%\Local\Ubisoft Game Launcher"
:: cFos
rd /s /q "%UserProfile%\AppData\Local\cFos"
MKLINK /D  "%UserProfile%\AppData\Local\cFos" "%CustAppDir%\Local\cFos"
:: converseen
rd /s /q "%UserProfile%\AppData\Local\converseen"
MKLINK /D  "%UserProfile%\AppData\Local\converseen" "%CustAppDir%\Local\converseen"
:: AIMP
rd /s /q "%UserProfile%\AppData\Roaming\AIMP" 
MKLINK /D  "%UserProfile%\AppData\Roaming\AIMP" "%CustAppDir%\Roaming\AIMP"
:: Atom
rd /s /q  "%UserProfile%\AppData\Roaming\Atom" 
MKLINK /D  "%UserProfile%\AppData\Roaming\Atom" "%CustAppDir%\Roaming\Atom"
:: Acronis
:: MKLINK /D  "%UserProfile%\AppData\Roaming\Acronis" "%CustAppDir%\Roaming\Acronis"
:: GitHub Desktop
rd /s /q "%UserProfile%\AppData\Roaming\GitHub Desktop"
MKLINK /D  "%UserProfile%\AppData\Roaming\GitHub Desktop" "%CustAppDir%\Roaming\GitHub Desktop"
:: Authy
:: MKLINK /D  "%UserProfile%\AppData\Roaming\Authy Desktop" "%CustAppDir%\Roaming\Authy Desktop"
:: BatteryBar
:: MKLINK /D  "%UserProfile%\AppData\Roaming\BatteryBar" "%CustAppDir%\Roaming\BatteryBar"
:: Burnaware
rd /s /q "%UserProfile%\AppData\Roaming\Burnaware"
MKLINK /D  "%UserProfile%\AppData\Roaming\Burnaware" "%CustAppDir%\Roaming\Burnaware"
:: IDM
rd /s /q "%UserProfile%\AppData\Roaming\IDM"
MKLINK /D  "%UserProfile%\AppData\Roaming\IDM" "%CustAppDir%\Roaming\IDM"
:: GIMP
rd /s /q "%UserProfile%\AppData\Roaming\GIMP"
MKLINK /D  "%UserProfile%\AppData\Roaming\GIMP" "%CustAppDir%\Roaming\GIMP"
:: Goldberg SteamEmu Saves
rd /s /q "%UserProfile%\AppData\Roaming\Goldberg SteamEmu Saves"
MKLINK /D  "%UserProfile%\AppData\Roaming\Goldberg SteamEmu Saves" "%CustAppDir%\Roaming\Goldberg SteamEmu Saves"
:: IV
rd /s /q "%UserProfile%\AppData\Roaming\IrfanView"
MKLINK /D  "%UserProfile%\AppData\Roaming\IrfanView" "%CustAppDir%\Roaming\IrfanView"
:: KC Softwares
rd /s /q "%UserProfile%\AppData\Roaming\KC Softwares"
MKLINK /D  "%UserProfile%\AppData\Roaming\KC Softwares" "%CustAppDir%\Roaming\KC Softwares"
:: Kodi
rd /s /q "%UserProfile%\AppData\Roaming\Kodi"
MKLINK /D  "%UserProfile%\AppData\Roaming\Kodi" "%CustAppDir%\Roaming\Kodi"
:: Notepad++
rd /s /q "%UserProfile%\AppData\Roaming\Notepad++" 
MKLINK /D "%UserProfile%\AppData\Roaming\Notepad++" "%CustAppDir%\Roaming\Notepad++"
:: Signal
MKLINK /D  "%UserProfile%\AppData\Roaming\Signal" "%CustAppDir%\Roaming\Signal"
:: TagScanner
rd /s /q "%UserProfile%\AppData\Roaming\TagScanner"
MKLINK /D  "%UserProfile%\AppData\Roaming\TagScanner" "%CustAppDir%\Roaming\TagScanner"
:: Spotify Cache UWP
rd /s /q "%UserProfile%\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalState\"
rd /s /q "%UserProfile%\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache\"
MKLINK /D "%UserProfile%\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalState" "%CustAppDir%\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalState"
MKLINK /D "%UserProfile%\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache" "%CustAppDir%\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache"
:: WinRAR
rd /s /q %UserProfile%\AppData\Roaming\WinRAR"
MKLINK /D  "%UserProfile%\AppData\Roaming\WinRAR" "%CustAppDir%\Roaming\WinRAR"
:: copyq
rd /s /q "%UserProfile%\AppData\Roaming\copyq"
MKLINK /D  "%UserProfile%\AppData\Roaming\copyq" "%CustAppDir%\Roaming\copyq"
:: picpick
rd /s /q "%UserProfile%\AppData\Roaming\picpick"
MKLINK /D  "%UserProfile%\AppData\Roaming\picpick" "%CustAppDir%\Roaming\picpick"
:: qBittorrent
rd /s /q "%UserProfile%\AppData\Roaming\qBittorrent"
MKLINK /D  "%UserProfile%\AppData\Roaming\qBittorrent" "%CustAppDir%\Roaming\qBittorrent"
:: Bitwarden
rd /s /q "%UserProfile%\AppData\Roaming\Bitwarden"
MKLINK /D  "%UserProfile%\AppData\Roaming\Bitwarden" "%CustAppDir%\Roaming\Bitwarden"
:: discord
rd /s /q "%UserProfile%\AppData\Roaming\discord"
MKLINK /D  "%UserProfile%\AppData\Roaming\discord" "%CustAppDir%\Roaming\discord"
:: VLC
rd /s /q "%UserProfile%\AppData\Roaming\vlc"
MKLINK /D  "%UserProfile%\AppData\Roaming\vlc" "%CustAppDir%\Roaming\vlc"
:: WhatsApp
rd /s /q "%UserProfile%\AppData\Roaming\WhatsApp"
MKLINK /D  "%UserProfile%\AppData\Roaming\WhatsApp" "%CustAppDir%\Roaming\WhatsApp"
:: Outlook
rd /s /q "%UserProfile%\AppData\Local\Microsoft\Outlook"
MKLINK /D  "%UserProfile%\AppData\Local\Microsoft\Outlook" "%CustAppDir%\Local\Microsoft\Outlook"
:: Edge Chromium
rd /s /q "%UserProfile%\AppData\Local\Microsoft\Edge\"
MKLINK /D  "%UserProfile%\AppData\Local\Microsoft\Edge" "%CustAppDir%\Local\Microsoft\Edge"
:: Themems
rd /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\Themes"
MKLINK /D  "%UserProfile%\AppData\Local\Microsoft\Windows\Themes" "%CustAppDir%\Local\Microsoft\Windows\Themes"
:: Chomikbox
rd /s /q "%UserProfile%\AppData\Local\Chomikbox"
MKLINK /D  "%UserProfile%\AppData\Local\Chomikbox" "%CustAppDir%\Local\Chomikbox"
:: Firefox
rd /s /q "%UserProfile%\AppData\Roaming\Mozilla\"
rd /s /q "%UserProfile%\AppData\Local\Mozilla\"
MKLINK /D  "%UserProfile%\AppData\Roaming\Mozilla\" "%CustAppDir%\Roaming\Mozilla\"
MKLINK /D  "%UserProfile%\AppData\Local\Mozilla\" "%CustAppDir%\Local\Mozilla\"
:: Thunderbird
rd /s /q "%UserProfile%\AppData\Roaming\Thunderbird\"
rd /s /q "%UserProfile%\AppData\Local\Thunderbird\"
MKLINK /D  "%UserProfile%\AppData\Roaming\Thunderbird\" "%CustAppDir%\Roaming\Thunderbird\"
MKLINK /D  "%UserProfile%\AppData\Local\Thunderbird\" "%CustAppDir%\Local\Thunderbird\"
:: JDownloader
rd /s /q "%UserProfile%\AppData\Local\JDownloader 2.0"
MKLINK /D  "%UserProfile%\AppData\Local\JDownloader 2.0" "%CustAppDir%\Local\JDownloader 2.0"
:: CODEX
::MKLINK /D  "c:\Users\Public\Documents\Steam" "d:\fademind\Documents\Steam"
::MKLINK /D  "%UserProfile%\AppData\Roaming\Steam" "%CustAppDir%\Local\Roaming\Steam"
:: WeMod
::MKLINK /D  "%UserProfile%\AppData\Roaming\WeMod" "%CustAppDir%\Local\Roaming\WeMod"

pause