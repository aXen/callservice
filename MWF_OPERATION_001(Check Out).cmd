@echo off
set HOME=%~dp0
cd %~dp0

if %PROCESSOR_ARCHITECTURE%==x86 (
    rem 32 bit
    rem @echo no
    rem @echo Some 32-bit work
    set NODE_HOME=%HOME%node-v6.10.1-win-86
) else (
    rem 64 bit
    rem @echo yes
    rem @echo Some 64-bit work
    set NODE_HOME=%HOME%node-v6.10.1-win-x64
)

echo %NODE_HOME%
del *.log
%NODE_HOME%\node.exe callservice.js -s "MWF_OPERATION_001(Check Out)"
pause