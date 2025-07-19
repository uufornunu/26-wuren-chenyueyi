file(GLOB SRC_FILES "src/*.cpp")

include_directories(${kalman_INCLUDE_DIRS})
include_directories(include)

add_library(M2 STATIC ${SRC_FILES})
target_link_libraries(M2 A2)