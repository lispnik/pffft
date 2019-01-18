(defsystem #:fpw-test
  :description "Test suite for simple CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :components ((:file "fpw-test"))
  :depends-on (#:fpw #:rt))
