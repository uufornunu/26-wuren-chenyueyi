file(GLOB SRC_FILES "src/*.cpp")

include_directories(include)

add_library(M1 STATIC ${SRC_FILES})
target_link_libraries(M1 A1)