@ECHO OFF
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
