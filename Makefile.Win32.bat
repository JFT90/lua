@echo off

set BUILD_ENGINE="Visual Studio 15 2017"
if not [%1] == [] set BUILD_ENGINE=%1

if not exist build\win32_rel mkdir build\win32_rel
pushd build\win32_rel
cmake ..\.. -G "%BUILD_ENGINE:"=%" -DUSE_STATIC_RT=OFF
cmake --build . --config Release
popd

if not exist build\win32_rel_mt mkdir build\win32_rel_mt
pushd build\win32_rel_mt
cmake ..\.. -G "%BUILD_ENGINE:"=%" -DUSE_STATIC_RT=ON
cmake --build . --config Release
popd
