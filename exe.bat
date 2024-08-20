@echo off

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release .. --fresh
cmake --build . --config Release
cmake -DCMAKE_BUILD_TYPE=Release .. --fresh
cmake --build . --config Release
cmake -DCMAKE_BUILD_TYPE=Debug .. --fresh
cmake --build . --config Debug
cmake -DCMAKE_BUILD_TYPE=Debug .. --fresh
cmake --build . --config Debug