set(CMAKE_SKIP_RPATH TRUE)

cmake_minimum_required(VERSION 3.16)
project(AmmoniteZ VERSION 0.1 LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Qml)
qt_standard_project_setup(REQUIRES 6.5)

add_subdirectory(AmmoniteZ)
