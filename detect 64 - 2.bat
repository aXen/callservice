@echo off
if %PROCESSOR_ARCHITECTURE%==x86 (
    rem 32 bit
    @echo no
    @echo Some 32-bit work
) else (
    rem 64 bit
    @echo yes
    @echo Some 64-bit work
)