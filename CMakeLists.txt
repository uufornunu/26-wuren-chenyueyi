# 版本设置  
cmake_minimum_required(VERSION 3.10 FATAL_ERROR)  
# 声明项目名称与语言
project(TEST LANGUAGES CXX)  

include_directories(modules/M1/include)
include_directories(modules/A1/include)
include_directories(modules/M2/include)
include_directories(modules/A2/include)
include_directories(common/kalman/include)
include_directories(common/math/include)

add_subdirectory(common)
add_subdirectory(modules)

find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
link_libraries( ${OpenCV_LIBS} A1 A2 M1 M2)

add_executable(test main.cpp)
