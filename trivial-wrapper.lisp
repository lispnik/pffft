(defpackage #:trivial-wrapper 
  (:use #:common-lisp)
  (:import-from #:cffi
		#:defctype
		#:null-pointer
		#:foreign-pointer)
  (:export #:define-wrapper
	   #:wrapper-pointer))

(in-package #:trivial-wrapper)

(defstruct (wrapper
	    (:copier nil)
	    (:constructor make-wrapper (pointer)))
  (pointer #.(null-pointer) :type foreign-pointer))

(defmacro define-wrapper (name)
  (let* ((name name)
	 (make-name (intern (format nil "MAKE-~:@A" (symbol-name name)))))
    `(progn
       (defstruct (,name
		   (:include wrapper)
		   (:copier nil)
		   (:constructor ,make-name (pointer))))
       (defctype ,name (:wrapper :pointer
			:from-c ,make-name 
			:to-c wrapper-pointer))
       (defmethod print-object ((instance ,name) stream)
	 (print-unreadable-object (instance stream :identity t)
	   (format stream "~:@A-WRAPPER" ,(symbol-name name))))
       ',name)))
