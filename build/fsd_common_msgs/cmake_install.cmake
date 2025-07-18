# Install script for directory: /home/chenyueyi/hw_ros_ws/src/fsd_common_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/chenyueyi/hw_ros_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/msg" TYPE FILE FILES
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/Cone.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/ConeDetections.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/Map.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/ControlCommand.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/CarState.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/CarStateDt.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/Mission.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/TrajectoryPoint.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/EchievMessage.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/RemoteControlCommand.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/AsensingMessage.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/AsState.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/ResAndAmi.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/Time.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/Feedback.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/Visualization.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/DecisionFlag.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/DrivingDynamics.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/CanFrames.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/ConeDbscan.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/ConeDetectionsDbscan.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/YoloCone.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/YoloConeDetections.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/YoloConeTrack.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/YoloConeDetectionsTrack.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/InsDelta.msg"
    "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/msg/SkidpadGlobalCenterLine.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/cmake" TYPE FILE FILES "/home/chenyueyi/hw_ros_ws/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgs-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/chenyueyi/hw_ros_ws/devel/include/fsd_common_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/chenyueyi/hw_ros_ws/devel/share/roseus/ros/fsd_common_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/chenyueyi/hw_ros_ws/devel/share/common-lisp/ros/fsd_common_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/chenyueyi/hw_ros_ws/devel/share/gennodejs/ros/fsd_common_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/chenyueyi/hw_ros_ws/devel/lib/python3/dist-packages/fsd_common_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/chenyueyi/hw_ros_ws/devel/lib/python3/dist-packages/fsd_common_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/chenyueyi/hw_ros_ws/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgs.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/cmake" TYPE FILE FILES "/home/chenyueyi/hw_ros_ws/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgs-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/cmake" TYPE FILE FILES
    "/home/chenyueyi/hw_ros_ws/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgsConfig.cmake"
    "/home/chenyueyi/hw_ros_ws/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs" TYPE FILE FILES "/home/chenyueyi/hw_ros_ws/src/fsd_common_msgs/package.xml")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/chenyueyi/hw_ros_ws/build/fsd_common_msgs/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
