(defsystem #:pffft
  :description "A simple CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "pffft"))
  :depends-on (#:cffi #:trivial-garbage)
  :in-order-to ((test-op (load-op "pffft-test")))
  :perform (test-op (o c) (symbol-call "RT" "DO-TESTS")))
