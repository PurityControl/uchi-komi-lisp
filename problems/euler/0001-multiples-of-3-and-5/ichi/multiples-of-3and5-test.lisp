(ql:quickload "lisp-unit")

(defpackage #:multiples-of-3and5-test
  (:use #:common-lisp #:lisp-unit))

(load "multiples-of-3and5")

(in-package #:multiples-of-3and5-test)

(define-test up-to-10
  (assert-equal 23 (multiples-of-3and5:to 10)))

(define-test up-to-1000
  (assert-equal 233168 (multiples-of-3and5:to 1000)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :multiples-of-3and5-test))
