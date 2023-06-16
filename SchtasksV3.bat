setlocal
set runlevel=/rl HIGHEST
set /a RandomNumber=%random%%%9+1

REM Execute SchTasks.exe
schtasks.exe /create /SC daily /mo 1 /tn "SIP" /TR "C:\Program Files\eSoft\SIP_Temp2\SIP_ON.bat"  /ST 0%RandomNumber%:00 /ru SYSTEM %runlevel%

pause