(ql:quickload "lisp-unit")

(defpackage #:smallest-multiple-test
  (:use #:common-lisp #:lisp-unit))

(load "smallest-multiple")

(in-package #:smallest-multiple-test)

(define-test common-multiple-p-true
  (assert-true (smallest-multiple:common-multiples-p 6 '(1 2 3))))

(define-test common-multiple-p-false
  (assert-false (smallest-multiple:common-multiples-p 12 '(1 2 3 5))))

(define-test smallest-multiple-for-1-to-10
  (assert-equal 2520 (smallest-multiple:smallest-multiple-for
		      '(1 2 3 4 5 6 7 8 9 10))))

(define-test smallest-multiple-for-1-to-10
  (assert-equal 232792560
		(smallest-multiple:smallest-multiple-for
		 '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))))
		
(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :smallest-multiple-test))
