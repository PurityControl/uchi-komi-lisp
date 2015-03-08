(ql:quickload "lisp-unit")

(defpackage #:sum-square-difference-test
  (:use #:common-lisp #:lisp-unit))

(load "sum-square-difference")

(in-package #:sum-square-difference-test)

(define-test sum-square-diffrence-for-1-to-10
    (assert-equal 2640 (sum-square-difference:difference-up-to 10)))

(define-test sum-square-difference-for-1-to-100
    (assert-equal 25164150 (sum-square-difference:difference-up-to 100)))

(define-test sum-squares-test
    (assert-equal 14 (sum-square-difference:sum-squares '(1 2 3))))

(define-test square-sums-test
    (assert-equal 36 (sum-square-difference:square-sums '(1 2 3))))

(define-test range-test
  (assert-equal '(1 2 3 4 5 6 7 8 9 10) (sum-square-difference:range 10)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :sum-square-difference-test))
