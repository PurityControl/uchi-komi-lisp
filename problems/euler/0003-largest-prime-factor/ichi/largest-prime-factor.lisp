(defpackage #:largest-prime-factor
  (:use #:cl)
  (:export #:largest-factor #:prime? #:kvals-from-k #:primes-from-k
	   #:first-factor #:accumulate-factors))
(in-package #:largest-prime-factor)

(defparameter *k* 1)
(defparameter *primes* '(2 3))
(defparameter *prime-factors* '())

(defun prime? (number previous-primes)
  ;;TODO only check up to sqaure root of primes
  (notany (lambda (x) (zerop (mod number x))) previous-primes))

(defun kvals-from-k (k-val)
  (list (1- (* k-val 6)) (1+ (* k-val 6))))

(defun primes-from-k (k-val primes)
  (remove-if-not #'(lambda (x) (prime? x primes)) (kvals-from-k k-val)))

(defun first-factor (number k lo-primes)
  (let ((factor (find-if #'(lambda (x) (zerop (mod number x))) lo-primes)))
    (if factor 
	factor
	(first-factor number 
		      (1+ k) 
		      (append (primes-from-k k lo-primes) lo-primes)))))
  
(defun accumulate-factors (number prime-factors)
  (let ((prime-factor-product (apply #'* prime-factors)))
    (if (eq prime-factor-product number)
	(reduce #'max prime-factors)
	(accumulate-factors 
	 number 
	 (cons 
	  (first-factor (/ number prime-factor-product) 1 '(2 3))
	  prime-factors)))))


(defun largest-factor (number)
  ;; TODO implement me
  (accumulate-factors number '()))
