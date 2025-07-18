; Auto-generated. Do not edit!


(cl:in-package package2-msg)


;//! \htmlinclude TurtleVel.msg.html

(cl:defclass <TurtleVel> (roslisp-msg-protocol:ros-message)
  ((linear_x
    :reader linear_x
    :initarg :linear_x
    :type cl:float
    :initform 0.0)
   (linear_y
    :reader linear_y
    :initarg :linear_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurtleVel (<TurtleVel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleVel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleVel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package2-msg:<TurtleVel> is deprecated: use package2-msg:TurtleVel instead.")))

(cl:ensure-generic-function 'linear_x-val :lambda-list '(m))
(cl:defmethod linear_x-val ((m <TurtleVel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package2-msg:linear_x-val is deprecated.  Use package2-msg:linear_x instead.")
  (linear_x m))

(cl:ensure-generic-function 'linear_y-val :lambda-list '(m))
(cl:defmethod linear_y-val ((m <TurtleVel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package2-msg:linear_y-val is deprecated.  Use package2-msg:linear_y instead.")
  (linear_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleVel>) ostream)
  "Serializes a message object of type '<TurtleVel>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linear_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linear_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleVel>) istream)
  "Deserializes a message object of type '<TurtleVel>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleVel>)))
  "Returns string type for a message object of type '<TurtleVel>"
  "package2/TurtleVel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleVel)))
  "Returns string type for a message object of type 'TurtleVel"
  "package2/TurtleVel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleVel>)))
  "Returns md5sum for a message object of type '<TurtleVel>"
  "a3fdb229f5180380da4e895a9cc9fb8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleVel)))
  "Returns md5sum for a message object of type 'TurtleVel"
  "a3fdb229f5180380da4e895a9cc9fb8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleVel>)))
  "Returns full string definition for message of type '<TurtleVel>"
  (cl:format cl:nil "float32 linear_x~%float32 linear_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleVel)))
  "Returns full string definition for message of type 'TurtleVel"
  (cl:format cl:nil "float32 linear_x~%float32 linear_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleVel>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleVel>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleVel
    (cl:cons ':linear_x (linear_x msg))
    (cl:cons ':linear_y (linear_y msg))
))
