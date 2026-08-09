@echo off

cmake -S godot-cpp -B build -DGODOTCPP_TARGET=template_debug -DCMAKE_BUILD_TYPE=Debug
cmake --build build --config Debug

cmake -S godot-cpp -B build -DGODOTCPP_TARGET=template_release -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
