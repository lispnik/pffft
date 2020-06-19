(defpackage #:pffft-test
  (:use #:common-lisp
        #:prove
        #:pffft))

(in-package #:pffft-test)

(plan 1)

(define-foreign-pointer-wrapper foo)

(let ((foo (make-instance 'foo)))
  (ok (cffi:null-pointer-p (pointer foo)) "properly initialized with null pointer"))

(finalize)
