@echo off


::��ѯ���

echo CPC�Ƿ�װ?
reg query HKEY_LOCAL_MACHINE\SOFTWARE\gwssi\CPC 1>nul 2>nul && echo     �Ѱ�װ || echo     δ��װ

echo MDAC:
reg query HKEY_LOCAL_MACHINE\Software\Microsoft\DataAccess |find "version" /i
reg query HKEY_CLASSES_ROOT | find "access.oledb" /i

echo MS JET OLE DB 40
if not exist C:\Windows\SysWOW64\msjetoledb40.dll (echo     miss) else (echo     exist)

echo NET Framework:
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" |find "ver" /i

echo MSXML:
reg query HKEY_CLASSES_ROOT\TypeLib\{F5078F18-C551-11D3-89B9-0000F81FE221} /ve /s | find "xml" /i
pause

::��װ���������
::for /f "tokens=*" %%i in ('dir /s /b /on *.exe *.msi ^|find "old" /i /v') do "%%~fi"
pause






