
(defpackage #:largest-prime-factor
  (:use #:cl)
  (:export #:largest-factor #:primes-to))
(in-package #:largest-prime-factor)

(defun seive (primes bucket)
  (if (null bucket)
      primes
    (seive
     (cons (car bucket) primes)
     (remove-if #'(lambda (x) (zerop (mod x (car bucket)))) (cdr bucket)))))

(defun primes-to (number)
  "determine the largest prime factor for number"
  (labels ((natural-numbers (number)
                  (coerce (loop for x from 3 to number in 2 collect x) 'vector)))
          (let ((number-bucket (natural-numbers number)))
            (seive '(2) number-bucket))))

(defun largest-factor (number)
  (let* ((primes (copy-list (primes-to number)))
         (prime-factor
          (remove-if-not #'(lambda (x) (zerop (mod number x))) primes)))
    (print prime-factors)))


(defun primes-up-to (number k-val primes)
  (let ((test-for-prime (list (1- (* k-val 6)) (1+ (* k-val 6)))))
    (labels ((is-prime (number)
	       (notany (lambda (x) (zerop (mod number x))) primes)))
      (let ((new-primes 
	     (append
	      primes
	      (remove-if-not #'is-prime test-for-prime))))
	(if (> (1+ (* k-val 6)) number)
	    new-primes
	    (primes-up-to number (1+ k-val) new-primes))))))
