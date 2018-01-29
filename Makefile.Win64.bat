@echo off

set BUILD_ENGINE="Visual Studio 15 2017"
if not [%1] == [] set BUILD_ENGINE=%1

if not exist build\win64_rel mkdir build\win64_rel
pushd build\win64_rel
cmake ..\.. -G "%BUILD_ENGINE:"=% Win64" -DUSE_STATIC_RT=OFF
cmake --build . --config Release
popd

if not exist build\win64_rel_mt mkdir build\win64_rel_mt
pushd build\win64_rel_mt
cmake ..\.. -G "%BUILD_ENGINE:"=% Win64" -DUSE_STATIC_RT=ON
cmake --build . --config Release
popd
