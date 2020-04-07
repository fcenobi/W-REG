@echo off
@echo "This batch file from MajorGeeks.Com will delete the folder C:\$Windows.~WS and C:\$Windows.~BT on Windows 10 only."
@echo --------------------------------
@echo If you get the message "The system cannot find the file specified" it means the folder is already deleted.
@echo --------------------------------
PAUSE
RD /S /Q "C:\$Windows.~WS"
RD /S /Q "C:\$Windows.~BT"
@echo --------------------------------
@echo All done
@echo --------------------------------
PAUSE NULL