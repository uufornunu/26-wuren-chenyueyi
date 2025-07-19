cmake_minimum_required(VERSION 3.5)
project(package2)  #项目名

# C++11标准
add_compile_options(-std=c++11)

# 查找依赖包
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation  # 消息生成依赖
)

# 在msg目录下面自定义消息文件
add_message_files(
  FILES
  TurtleVel.msg
) 

# 生成消息
generate_messages(
  DEPENDENCIES
  std_msgs  #依赖std_msgs
)

# 声明catkin包
catkin_package(
  CATKIN_DEPENDS roscpp rospy std_msgs message_runtime #指定依赖
)

# 包含目录
include_directories(
  include
  ${catkin_INCLUDE_DIRS}  # ROS相关头文件
)

# C++可执行文件
add_executable(turtle_controller_node  # 可执行文件名
  src/turtle_controller.cpp  # 源文件路径
)

catkin_install_python(
  PROGRAMS scripts/cone_counter.py  # 声明可执行文件
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
# 链接库文件
target_link_libraries(turtle_controller_node
  ${catkin_LIBRARIES}  # ROS相关库
)

# 添加消息生成依赖
add_dependencies(turtle_controller_node
  ${${PROJECT_NAME}_EXPORTED_TARGETS}
  ${catkin_EXPORTED_TARGETS}
)

# Python脚本
catkin_install_python(PROGRAMS
  scripts/turtle_vel_pub.py  # Python脚本路径
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}  # 安装目标路径
)

# 配置文件
install(DIRECTORY 
  config  #文件目录
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}  # 安装路径
)

# 启动文件
install(DIRECTORY 
  launch  # 启动文件目录
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}  # 安装路径
)
