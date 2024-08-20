@echo off

mkdir build
cd build
cmake .. --fresh
cmake --build .
cmake --build .