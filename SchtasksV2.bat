setlocal
set runlevel=/rl HIGHEST

REM Execute SchTasks.exe
schtasks.exe /create /SC daily /mo 1 /tn "SIP" /TR "C:\Program Files\eSoft\SIP_Temp2\SIP_ON.bat"  /ST 00:00 /ru SYSTEM %runlevel%

pause