cmake_minimum_required(VERSION 3.5)
project(fsd_common_msgs)
set(can_msgs_DIR "/opt/ros/noetic/share/can_msgs/cmake")  # 替换为实际路径[6,8](@ref)
find_package(catkin REQUIRED COMPONENTS
  message_generation  # Needed to generate custom message types
  std_msgs
  roscpp
  rospy
  geometry_msgs
  can_msgs
  nav_msgs
  )

add_message_files(  # Tell catkin which custom message files to include
  FILES
  Cone.msg
  ConeDetections.msg
  Map.msg
  ControlCommand.msg
  CarState.msg
  CarStateDt.msg
  Mission.msg
  TrajectoryPoint.msg
  EchievMessage.msg
  RemoteControlCommand.msg
  AsensingMessage.msg
  AsState.msg
  ResAndAmi.msg
  Time.msg
  Feedback.msg
  Visualization.msg
  DecisionFlag.msg
  DrivingDynamics.msg
  CanFrames.msg
  ConeDbscan.msg
  ConeDetectionsDbscan.msg
  YoloCone.msg
  YoloConeDetections.msg
  YoloConeTrack.msg
  YoloConeDetectionsTrack.msg
  InsDelta.msg
  SkidpadGlobalCenterLine.msg
  )

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  can_msgs
  nav_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime std_msgs geometry_msgs can_msgs# Needed to generate custom messages
)
include_directories(
  # include
  ${catkin_INCLUDE_DIRS}
  ${roscpp_INCLUDE_DIRS}
  ${rospy_INCLUDE_DIRS}
)

