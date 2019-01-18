(defsystem #:fpw
  :description "A simple CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "fpw"))
  :depends-on (#:cffi)
  :in-order-to ((test-op (load-op "fpw-test")))
  :perform (test-op (o c) (symbol-call "RT" "DO-TESTS")))
