@echo off
echo �ļ��ŵ�cpc��װĿ¼

::��ȡ�ļ�Ŀ¼
set cpcdir=%~dp0
set cpczipdir=%cpcdir:CPC�ͻ���\=%
for /f "tokens=*" %%i in ('dir  /b /s "%cpczipdir%"cpc.zip') do set cpczip=%%~fi
set update=%cpcdir:CPC�ͻ���\=Eϵͳ(EES)��������\update\updateSipo.exe%
echo %cpczipdir% %cpczip%
pause

::�������
call "%update%"

::�ж�winrar�Ƿ�װ���滻CPC
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ | find /i "rar">nul 2>nul
if %errorlevel% equ 0 (start winrar x "%cpczip%" /o+ ) else (echo replace manually)

::ע�����
cd %~dp0
for %%i in (%~dp0*.ocx) do  regsvr32 "%%~fi"
echo regsvr32 /s gwssiSys.dll

::����ʱɾ����̨word����
for /f "tokens=2 delims= " %%i in ('tasklist ^|find "winword" /i') do echo taskkill /pid %%i /f
pause