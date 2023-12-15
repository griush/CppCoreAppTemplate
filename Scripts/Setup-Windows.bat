@echo off

pushd ..
premake5 --file=Build.lua vs2022
popd
pause
