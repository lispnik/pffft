(defsystem #:foreign-pointer-wrapper
  :description "A simple CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "foreign-pointer-wrapper"))
  :depends-on (#:cffi))
