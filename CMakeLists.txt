cmake_minimum_required(VERSION 3.30)

project(godot-cxx-proj)

if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp)
    execute_process(
        COMMAND git clone https://github.com/godotengine/godot-cpp.git ../godot-cpp
    )
endif()

file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/lib)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/classes)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/core)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/variant)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/templates)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/src)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/build)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/gdextension)
write_file(${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/.gdignore "")

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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/classes/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/core/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/variant/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/templates/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/include/godot_cpp/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/lib/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/src/${file_name})
    if(NOT EXISTS ${TO_FILE})
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
    set(TO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/gdextension/${file_name})
    if(NOT EXISTS ${TO_FILE})
        add_custom_command(
            TARGET copy_src_files
            COMMAND ${CMAKE_COMMAND} -E copy 
            ${FM_FILE}
            ${TO_FILE}
        )
    endif()
endforeach(template_src_file)

set(TEMPLATE_CMAKELIST_H_FM ${CMAKE_CURRENT_SOURCE_DIR}/godot-cpp/test/CMakeLists.txt)
set(TEMPLATE_CMAKELIST_H_TO ${CMAKE_CURRENT_SOURCE_DIR}/bin/gdextension_proj/CMakeLists.txt)

if(NOT EXISTS ${TEMPLATE_CMAKELIST_H_TO})
    file(READ ${TEMPLATE_CMAKELIST_H_FM} FILE_CONTENTS)
    string(REPLACE "../gdextension/ CACHE STRING \"Path to GDExtension interface header directory\"" "\$\{CMAKE_CURRENT_SOURCE_DIR\}/gdextension" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "../ CACHE STRING \"Path to C++ bindings\"" "\$\{CMAKE_CURRENT_SOURCE_DIR\}" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "project(godot-cpp-test)" "project(godot-cxx-extension)" FILE_CONTENTS ${FILE_CONTENTS})
    string(REPLACE "\$\{CPP_BINDINGS_PATH\}/bin/" "\$\{CPP_BINDINGS_PATH\}/lib/" FILE_CONTENTS ${FILE_CONTENTS})

    file(WRITE ${TEMPLATE_CMAKELIST_H_TO} "${FILE_CONTENTS}")
endif()



add_dependencies(godot-cpp copy_include_files)
add_dependencies(copy_include_files copy_lib_files)
add_dependencies(copy_lib_files copy_src_files)