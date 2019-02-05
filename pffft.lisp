(defpackage #:pffft
  (:use #:common-lisp)
  (:export #:define-foreign-pointer-wrapper
	   #:pointer))

(in-package #:pffft)

(cffi:define-foreign-type pointer-wrapper ()
  ((pointer
    :initarg :pointer
    :initform (cffi:null-pointer) 
    :reader pointer))
  (:actual-type :pointer))

(defmacro define-foreign-pointer-wrapper (name &optional cleanup-func)
  `(progn
     (cffi:define-foreign-type ,name (pointer-wrapper)
       ()
       (:simple-parser ,name))
     
     (defmethod cffi:translate-to-foreign (value (type ,name))
       (check-type value ,name)
       (pointer value))

     (defmethod cffi:translate-from-foreign (value (type ,name))
       (make-instance ',name :pointer value))

     ,(when cleanup-func
	`(defmethod make-instance :after ((instance ,name) &rest initargs)
	   (declare (ignore initargs))
	   (let ((pointer (pointer instance)))
	     (tg:finalize
	      instance
	      #'(lambda ()
		  (funcall #',cleanup-func pointer))))))
     ',name))
