
(cl:in-package :asdf)

(defsystem "package2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TurtleVel" :depends-on ("_package_TurtleVel"))
    (:file "_package_TurtleVel" :depends-on ("_package"))
  ))