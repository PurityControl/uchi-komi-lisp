(defpackage #:smallest-multiple
  (:use #:cl)
  (:export #:common-multiples-p #:smallest-multiple-for))
(in-package #:smallest-multiple)

(defun common-multiples-p (number lo-numbers)
  (every #'(lambda (x) (zerop (mod number x))) lo-numbers))

(defun smallest-multiple-for (lo-numbers)
  (let ((max-num (apply #'max lo-numbers)))
    (labels ((smallest-multiple (lo-numbers multiple)
	       (if (common-multiples-p multiple lo-numbers)
		   multiple
		   (smallest-multiple lo-numbers (+ max-num multiple)))))
    (smallest-multiple lo-numbers max-num))))
