@echo off
rem ��ƮwIP\��Ʈw�������W��
set dbIp=(local)
rem ��Ʈw�W��
set dbName=DRIP
rem �n�J�b��
set dbUsrAcc=sa
rem �ϥΪ̱K�X
set dbUsrPwd=!Q@W3e4r
rem ��z������SQL���O����Ƨ���m
set batchFilePath="C:\Upgrde_Script"

rem �{���}�l����
cd %batchFilePath%

FOR /f %%i IN ('DIR *.Sql /B') do call :RunScript %%i
GOTO :END

:RunScript
Echo Executing %1
sqlcmd -S %dbIp% -d %dbName% -U %dbUsrAcc% -P %dbUsrPwd% -i %1 >>view.log
Echo Completed %1

:END