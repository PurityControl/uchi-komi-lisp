
(ql:quickload "lisp-unit")

(defpackage #:even-fibs-test
  (:use #:common-lisp #:lisp-unit))

(load "even-fibs")

(in-package #:even-fibs-test)

(define-test up-to-4000000
  (assert-equal 4613732 (even-fibs:to 4000000)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :even-fibs-test))
