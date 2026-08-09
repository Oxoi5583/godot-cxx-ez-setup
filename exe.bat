@echo off


mkdir build
cd build
cmake -DGODOTCPP_TARGET=template_release -DCMAKE_BUILD_TYPE=Release .. --fresh
cmake --build . --config Release
cmake -DGODOTCPP_TARGET=template_release -DCMAKE_BUILD_TYPE=Release .. --fresh
cmake --build . --config Release
cmake -B build -DGODOTCPP_TARGET=template_debug -DCMAKE_BUILD_TYPE=Debug .. --fresh
cmake --build . --config Debug
cmake -B build -DGODOTCPP_TARGET=template_debug -DCMAKE_BUILD_TYPE=Debug .. --fresh
cmake --build . --config Debug
