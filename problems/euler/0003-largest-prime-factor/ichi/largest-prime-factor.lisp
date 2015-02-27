(defpackage #:largest-prime-factor
  (:use #:cl)
  (:export #:largest-factor #:prime? #:kvals-from-k #:primes-from-k
	   #:first-factor))
(in-package #:largest-prime-factor)

(defparameter *k* 1)
(defparameter *primes* '(2 3))

(defun largest-factor (number)
  ;; TODO implement me
  number)

(defun prime? (number previous-primes)
  ;;TODO only check up to sqaure root of primes
  (notany (lambda (x) (zerop (mod number x))) previous-primes))

(defun kvals-from-k (k-val)
  (list (1- (* k-val 6)) (1+ (* k-val 6))))

(defun primes-from-k (k-val primes)
  (remove-if-not #'(lambda (x) (prime? x primes)) (kvals-from-k k-val)))

(defun first-factor (number)
  (find-if #'(lambda (x) number (zerop (mod number x))) *primes*))

