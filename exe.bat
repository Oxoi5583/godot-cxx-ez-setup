@echo off

mkdir build
cd build
cmake .. --fresh
cmake --build . --config Release
cmake .. --fresh
cmake --build . --config Release