;; Auto-generated. Do not edit!


(when (boundp 'fsd_common_msgs::ConeDetections)
  (if (not (find-package "FSD_COMMON_MSGS"))
    (make-package "FSD_COMMON_MSGS"))
  (shadow 'ConeDetections (find-package "FSD_COMMON_MSGS")))
(unless (find-package "FSD_COMMON_MSGS::CONEDETECTIONS")
  (make-package "FSD_COMMON_MSGS::CONEDETECTIONS"))

(in-package "ROS")
;;//! \htmlinclude ConeDetections.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass fsd_common_msgs::ConeDetections
  :super ros::object
  :slots (_header _cone_detections ))

(defmethod fsd_common_msgs::ConeDetections
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cone_detections __cone_detections) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _cone_detections __cone_detections)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cone_detections
   (&rest __cone_detections)
   (if (keywordp (car __cone_detections))
       (send* _cone_detections __cone_detections)
     (progn
       (if __cone_detections (setq _cone_detections (car __cone_detections)))
       _cone_detections)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; fsd_common_msgs/Cone[] _cone_detections
    (apply #'+ (send-all _cone_detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; fsd_common_msgs/Cone[] _cone_detections
     (write-long (length _cone_detections) s)
     (dolist (elem _cone_detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; fsd_common_msgs/Cone[] _cone_detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cone_detections (let (r) (dotimes (i n) (push (instance fsd_common_msgs::Cone :init) r)) r))
     (dolist (elem- _cone_detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get fsd_common_msgs::ConeDetections :md5sum-) "8d208cc8d9a8d2c9f26b340c91ec270a")
(setf (get fsd_common_msgs::ConeDetections :datatype-) "fsd_common_msgs/ConeDetections")
(setf (get fsd_common_msgs::ConeDetections :definition-)
      "std_msgs/Header header

fsd_common_msgs/Cone[] cone_detections
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: fsd_common_msgs/Cone
geometry_msgs/Point position  	      # coordinate of cone in [x, y]
std_msgs/String color                 # color of cone, 'b' = blue, 'y' = yellow, 'o' = orange
std_msgs/Float32 poseConfidence   	      # confidence of cone detect
std_msgs/Float32 colorConfidence   	      # confidence of cone detect

#uint8 cluster
#uint8 pointType
#uint8 pts
#uint8 visited
#uint8[] corepts

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Float32
float32 data
")



(provide :fsd_common_msgs/ConeDetections "8d208cc8d9a8d2c9f26b340c91ec270a")


