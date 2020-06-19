(defsystem #:pffft-test
  :description "Test suite for simple CFFI foreign-pointer wrapper."
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :license "MIT"
  :components ((:file "pffft-test"))
  :depends-on (#:pffft
               #:prove)
  :defsystem-depends-on (:prove-asdf)
  :perform (test-op (op c)
                    (uiop:symbol-call :prove-asdf '#:run c)))
