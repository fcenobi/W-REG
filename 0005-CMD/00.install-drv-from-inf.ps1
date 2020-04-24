## ## Dism /online /export-driver /destination:"d:\DriversBackup"

## Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
$dir = (Get-Item -Path ".\" -Verbose).FullName
Get-ChildItem $dir -Recurse -Filter "*.inf" | ForEach-Object { PNPUtil.exe -i -a $_.FullName}
