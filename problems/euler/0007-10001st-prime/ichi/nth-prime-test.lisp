(ql:quickload "lisp-unit")

(defpackage #:nth-prime-test
  (:use #:common-lisp #:lisp-unit))

(load "nth-prime")

(in-package #:nth-prime-test)

(define-test kvals-for-1
  (assert-equal '(5 7) (nth-prime:kvals-from-k 1)))

(define-test kvals-for-2
  (assert-equal '(11 13) (nth-prime:kvals-from-k 2)))

(define-test primes-from-k-for-1
  (assert-equal '(5 7) (nth-prime:primes-from-k 1 '(2 3))))

(define-test primes-from-k-for-4
  (assert-equal
   '(23)
   (nth-prime:primes-from-k
    4
    '(2 3 5 7 11 13 17 19))))

(define-test nth-prime-6
  (assert-equal 13 (nth-prime:nth-prime 6)))

(define-test nth-prime-10001
  (assert-equal 104743 (nth-prime:nth-prime 10001)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :nth-prime-test))
