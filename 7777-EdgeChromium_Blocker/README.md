# Denied Edge Chromium install 

1. Uninstall via following commands in elevated Command Promt as ADMIN:
```
cd C:\Program Files (x86)\Microsoft\Edge\Application\[latest_version]\Installer
setup.exe --uninstall --system-level --verbose-logging --force-uninstall
```
2. Execute where EdgeChromium_Blocker.cmd is:
```
./EdgeChromium_Blocker.cmd /B
```
OR ADD FILE `000-DoNotUpdateToEdgeWithChromium---ENABLE.reg` to registry. 

3. Done. 

REFERENCE:

- https://www.bleepingcomputer.com/news/microsoft/new-windows-10-updates-are-force-installing-microsoft-edge/
- https://www.bleepingcomputer.com/news/microsoft/how-to-block-windows-10-update-force-installing-the-new-edge-browser/
