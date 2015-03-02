(ql:quickload "lisp-unit")

(defpackage #:smallest-multiple-test
  (:use #:common-lisp #:lisp-unit))

(load "smallest-multiple")

(in-package #:smallest-multiple-test)

(define-test common-multiple-p-true
  (assert-true (smallest-multiple:common-multiples-p 6 '(1 2 3))))

(define-test common-multiple-p-false
  (assert-false (smallest-multiple:common-multiples-p 12 '(1 2 3 5))))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :smallest-multiple-test))
