file(GLOB SRC_FILES "src/*.cpp")

include_directories(include)

add_library(A1 STATIC ${SRC_FILES})