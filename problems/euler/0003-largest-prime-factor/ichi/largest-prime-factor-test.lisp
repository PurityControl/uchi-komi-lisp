(ql:quickload "lisp-unit")

(defpackage #:largest-prime-factor-test
  (:use #:common-lisp #:lisp-unit))

(load "largest-prime-factor")

(in-package #:largest-prime-factor-test)

(define-test primes-to-20
  (assert-equal '(19 17 13 11 7 5 3 2) (largest-prime-factor:primes-to 20)))

(define-test largest-prime-for-13195
  (assert-equal 29 (largest-prime-factor:largest-factor 13195)))

(define-test largest-prime-for-600851475143
  (assert-equal 6857 (largest-prime-factor:largest-factor 600851475143)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :largest-prime-factor-test))
