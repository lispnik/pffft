(defsystem #:trivial-wrapper
  :description "A trivial CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "trivial-wrapper"))
  :depends-on (#:cffi))
