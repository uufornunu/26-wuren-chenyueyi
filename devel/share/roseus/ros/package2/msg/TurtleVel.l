;; Auto-generated. Do not edit!


(when (boundp 'package2::TurtleVel)
  (if (not (find-package "PACKAGE2"))
    (make-package "PACKAGE2"))
  (shadow 'TurtleVel (find-package "PACKAGE2")))
(unless (find-package "PACKAGE2::TURTLEVEL")
  (make-package "PACKAGE2::TURTLEVEL"))

(in-package "ROS")
;;//! \htmlinclude TurtleVel.msg.html


(defclass package2::TurtleVel
  :super ros::object
  :slots (_linear_x _linear_y ))

(defmethod package2::TurtleVel
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:linear_y __linear_y) 0.0)
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _linear_y (float __linear_y))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:linear_y
   (&optional __linear_y)
   (if __linear_y (setq _linear_y __linear_y)) _linear_y)
  (:serialization-length
   ()
   (+
    ;; float32 _linear_x
    4
    ;; float32 _linear_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _linear_x
       (sys::poke _linear_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linear_y
       (sys::poke _linear_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _linear_x
     (setq _linear_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linear_y
     (setq _linear_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get package2::TurtleVel :md5sum-) "a3fdb229f5180380da4e895a9cc9fb8d")
(setf (get package2::TurtleVel :datatype-) "package2/TurtleVel")
(setf (get package2::TurtleVel :definition-)
      "float32 linear_x
float32 linear_y

")



(provide :package2/TurtleVel "a3fdb229f5180380da4e895a9cc9fb8d")


