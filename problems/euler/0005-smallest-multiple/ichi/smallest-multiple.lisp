(defpackage #:smallest-multiple
  (:use #:cl)
  (:export #:common-multiples-p))
(in-package #:smallest-multiple)

(defun common-multiples-p (number lo-numbers)
  (every #'(lambda (x) (zerop (mod number x))) lo-numbers))
