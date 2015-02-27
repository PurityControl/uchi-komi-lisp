(ql:quickload "lisp-unit")

(defpackage #:largest-prime-factor-test
  (:use #:common-lisp #:lisp-unit))

(load "largest-prime-factor")

(in-package #:largest-prime-factor-test)

(define-test kvals-for-1
  (assert-equal '(5 7) (largest-prime-factor:kvals-from-k 1)))

(define-test kvals-for-2
  (assert-equal '(11 13) (largest-prime-factor:kvals-from-k 2)))

(define-test primes-from-k-for-1
  (assert-equal '(5 7) (largest-prime-factor:primes-from-k 1 '(2 3))))

(define-test primes-from-k-for-4
  (assert-equal 
   '(23) 
   (largest-prime-factor:primes-from-k 
    4 
    '(2 3 5 7 11 13 17 19))))

(define-test first-factor-for-6
  (assert-equal 2 (largest-prime-factor:first-factor 6 1 '(2 3))))

(define-test first-factor-for-7
  (assert-equal 7 (largest-prime-factor:first-factor 7 1 '(2 3))))

(define-test first-factor-for-9
  (assert-equal 3 (largest-prime-factor:first-factor 9 1 '(2 3))))

(define-test first-factor-for-47
  (assert-equal 47 (largest-prime-factor:first-factor 47 1 '(2 3))))

(define-test largest-prime-for-13195
  (assert-equal 29 (largest-prime-factor:largest-factor 13195)))

(define-test accumulate-factors-for-6
  (assert-equal 3 (largest-prime-factor:accumulate-factors 6 '(2 3))))

(define-test accumulate-factors-for-18
  (assert-equal 3 (largest-prime-factor:accumulate-factors 18 '(2 3))))

(define-test largest-prime-for-600851475143
  (assert-equal 6857 (largest-prime-factor:largest-factor 600851475143)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :largest-prime-factor-test))
