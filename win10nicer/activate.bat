:: Last modified: Fri 12 Feb 17:08 EET 2021
:: 55BAB30913B91B33 
@echo off
set "params=%*"
:: This is just to make sure if this script is ran seperately, to make sure were Admin.
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Obviously we need a working network connection to connect to the KMS.
echo "Testing network..."
set IPaddress=8.8.8.8
:TESTNET
ping -n 1 %IPaddress% | find "TTL=" > NUL
if errorlevel 1 (
    goto RETRYNET
) else (
    goto ACTIVATE
)

:RETRYNET
timeout /t 1 /nobreak > NUL
ping 127.0.0.1 -n 11>nul
goto TESTNET

:ACTIVATE
echo "Activating windows."
:: Setting the KMS to be my private one.
start slmgr /skms REDACTED
echo "Key server set."
:: You can actually change this key to be any in this list (https://py-kms.readthedocs.io/en/latest/Keys.html (https://archive.vn/1gRmM)) and you should get an working activation.
start slmgr /ipk 9FNHH-K3HBT-3W4TD-6383H-6XYWF
echo "Set activation key."
start slmgr /ato
echo "Everything done, finishing setup & rebooting..."
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v DisplayVersion /t REG_DWORD /d 1 /f
:: We need to give windows time to actually finish everything (No, as far as i know Windows is dumb and just goes haywire and doesn't finish setup correctly even when this script is ran as the last thing to do in setup).
timeout /t 21 /nobreak > NUL
shutdown.exe /r /t 00
exit
