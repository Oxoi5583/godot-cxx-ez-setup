cmake_minimum_required(VERSION 3.30)

project(godot-cxx-proj)

if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp)
    execute_process(
        COMMAND git clone https://github.com/godotengine/godot-cpp.git ../godot-cpp
    )
endif()

file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/lib)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/classes)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/core)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/variant)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/templates)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/src)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/build)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/gdextension)
write_file(${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/.gdignore "")

message(${CMAKE_CURRENT_SOURCE_DIR}/build/godot-cpp/)

add_subdirectory(godot-cpp ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp)

add_custom_target(copy_include_files)
add_custom_target(copy_lib_files)
add_custom_target(copy_src_files)


file(GLOB include_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/gen/include/godot_cpp/classes/*.*
                            ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/include/godot_cpp/classes/*.*)
foreach(include_file ${include_files})
    get_filename_component(file_name ${include_file} NAME)
    set(FM_FILE ${include_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/classes/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E copy 
                ${FM_FILE}
                ${TO_FILE}
        )
    endif()
endforeach(include_file)

file(GLOB include_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/gen/include/godot_cpp/core/*.*
                            ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/include/godot_cpp/core/*.*)
foreach(include_file ${include_files})
    get_filename_component(file_name ${include_file} NAME)
    set(FM_FILE ${include_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/core/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(include_file)

file(GLOB include_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/gen/include/godot_cpp/variant/*.*
                            ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/include/godot_cpp/variant/*.*)
foreach(include_file ${include_files})
    get_filename_component(file_name ${include_file} NAME)
    set(FM_FILE ${include_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/variant/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(include_file)

file(GLOB include_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/gen/include/godot_cpp/templates/*.*
                            ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/include/godot_cpp/templates/*.*)
foreach(include_file ${include_files})
    get_filename_component(file_name ${include_file} NAME)
    set(FM_FILE ${include_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/templates/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(include_file)

file(GLOB include_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/include/godot_cpp/*.h**)
foreach(include_file ${include_files})
    get_filename_component(file_name ${include_file} NAME)
    set(FM_FILE ${include_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/include/godot_cpp/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_include_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(include_file)

file(GLOB lib_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/bin/Debug/*.a 
                    ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/bin/Debug/*.lib
                    ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/bin/Release/*.a 
                    ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/bin/Release/*.lib  
                    )
foreach(lib_file ${lib_files})
    get_filename_component(file_name ${lib_file} NAME)
    set(FM_FILE ${lib_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/lib/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_lib_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_lib_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(lib_file)

file(GLOB template_src_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/test/src/*)
foreach(template_src_file ${template_src_files})
    get_filename_component(file_name ${template_src_file} NAME)
    set(FM_FILE ${template_src_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/src/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_src_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_src_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(template_src_file)

file(GLOB template_src_files ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/gdextension/*)
foreach(template_src_file ${template_src_files})
    get_filename_component(file_name ${template_src_file} NAME)
    set(FM_FILE ${template_src_file})
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/gdextension/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_src_files
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
            "Moving ${file_name}..."
        )
        add_custom_command(
            TARGET copy_src_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(template_src_file)

set(FM_FILE "${CMAKE_CURRENT_SOURCE_DIR}/other/GDExtensionModule.gdextension")
set(TO_FILE "${CMAKE_CURRENT_SOURCE_DIR}/bin/GDExtensionModule.gdextension")
if(NOT EXISTS ${TO_FILE})
    file(READ ${FM_FILE} FILE_CONTENTS)
    file(WRITE ${TO_FILE} "${FILE_CONTENTS}")
endif()

#Get Template CmakeLists.txt
set(TEMPLATE_CMAKELIST_H_FM ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/test/CMakeLists.txt)
set(TEMPLATE_CMAKELIST_H_TO ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/CMakeLists.txt)

#Modify Template CmakeLists.txt and copy to dev folder
if(NOT EXISTS ${TEMPLATE_CMAKELIST_H_TO})
    file(READ ${TEMPLATE_CMAKELIST_H_FM} FILE_CONTENTS)
    string(REPLACE "../gdextension/ CACHE STRING \"Path to GDExtension interface header directory\"" "\$\{CMAKE_CURRENT_SOURCE_DIR\}/gdextension" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "../ CACHE STRING \"Path to C++ bindings\"" "\$\{CMAKE_CURRENT_SOURCE_DIR\}" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "project(godot-cpp-test)" "project(godot-cxx-extension)" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "\$\{CPP_BINDINGS_PATH\}/bin/" "\$\{CPP_BINDINGS_PATH\}/lib/" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \"\$\{BUILD_PATH\}\")" "set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \"../..\")" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG \"\$\{BUILD_PATH\}\")" "SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG \"../..\")" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE \"\$\{BUILD_PATH\}\")" "SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE \"../..\")" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "# Add the compile flags" "string(TOLOWER \$\{CMAKE_SYSTEM_PROCESSOR\} CPU_TYPE)" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "gdexample" "GdExtensionModule.\$\{SYSTEM_NAME\}.\$\{BUILD_TYPE\}.\$\{CPU_TYPE\}" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "set(BUILD_PATH \$\{CMAKE_SOURCE_DIR\}/bin/\$\{TARGET_PATH\})" "set(BUILD_PATH \$\{CMAKE_SOURCE_DIR\}/bin/\$\{TARGET_PATH\})\nset(CMAKE_PDB_OUTPUT_DIRECTORY \"\$\{BUILD_PATH\}\")" FILE_CONTENTS ${FILE_CONTENTS})
    file(WRITE ${TEMPLATE_CMAKELIST_H_TO} "${FILE_CONTENTS}")
endif()

#Create a compile batch file
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	set(SCRIPTS_EXT ".sh")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	set(SCRIPTS_EXT ".bat")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
	set(SCRIPTS_EXT ".sh")
else()
    set(SCRIPTS_EXT ".bat")
endif()
set(COMPILE_SCRIPT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/compile${SCRIPTS_EXT})
file(WRITE ${COMPILE_SCRIPT_FILE} "cd build\ncmake -DCMAKE_BUILD_TYPE=Release .. --fresh\ncmake --build . --config Release\ncmake -DCMAKE_BUILD_TYPE=Debug .. --fresh\ncmake --build . --config Debug")

#Create a Readme tips
set(README_MD_TO ${CMAKE_CURRENT_SOURCE_DIR}/bin/dev/readme.md)
if(NOT EXISTS ${README_MD_TO})
    set(README_CONTENTS "Put This ${CMAKE_CURRENT_SOURCE_DIR}/bin folder into the godot project")
    file(WRITE ${README_MD_TO} "${README_CONTENTS}")
endif()

#Run the coping jobs
add_dependencies(godot-cpp copy_include_files)
add_dependencies(copy_include_files copy_lib_files)
add_dependencies(copy_lib_files copy_src_files)