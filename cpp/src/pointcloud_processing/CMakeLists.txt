cmake_minimum_required(VERSION 3.5)
project(pointcloud_processing)

# 查找依赖包
find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
  pcl_conversions
  pcl_ros
  message_filters
)

find_package(PCL 1.10 REQUIRED COMPONENTS common io)

# 声明catkin包
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS roscpp sensor_msgs pcl_conversions pcl_ros
)

# 包含目录
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
)

# 添加可执行文件
add_executable(pointcloud_processing_node 
  src/pointcloud_processing.cpp
)

# 链接库
target_link_libraries(pointcloud_processing_node
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
)

# 安装目标
install(TARGETS pointcloud_processing_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
