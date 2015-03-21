(defpackage #:nth-prime
  (:use #:cl)
  (:export #:nth-prime #:prime? #:kvals-from-k #:primes-from-k))
(in-package #:nth-prime)

(defun prime? (number previous-primes)
  ;;TODO only check up to sqaure root of primes
  (notany (lambda (x) (zerop (mod number x))) previous-primes))

(defun kvals-from-k (k-val)
  (list (1- (* k-val 6)) (1+ (* k-val 6))))

(defun primes-from-k (k-val primes)
  (remove-if-not #'(lambda (x) (prime? x primes)) (kvals-from-k k-val)))

(defun nth-prime (number)
  (labels ((nth-prime-coll (number lo-primes kval)
	    (if (>= (length lo-primes) number)
		(nth (1- number) lo-primes)
		(nth-prime-coll number (append lo-primes (primes-from-k kval lo-primes))  (1+ kval)))))
    (nth-prime-coll number '(2 3) 1)))
