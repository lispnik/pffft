(defsystem #:pffft-test
  :description "Test suite for simple CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :components ((:file "pffft-test"))
  :depends-on (#:pffft #:rt))
