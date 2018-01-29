@echo off

set BUILD_ENGINE="Visual Studio 15 2017"
if not [%1] == [] set BUILD_ENGINE=%1

call Makefile.Win32.bat %BUILD_ENGINE%
call Makefile.Win64.bat %BUILD_ENGINE%
popd
