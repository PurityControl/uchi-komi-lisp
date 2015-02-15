
(defpackage #:largest-prime-factor
  (:use #:cl)
  (:export #:largest-factor #:primes-to))
(in-package #:largest-prime-factor)

(defun primes-to (number)
  "determine the largest prime factor for number"
  (labels ((seive (number)
                  (loop for x from 2 to number
                        collect x)))
          (print (seive 20))))

(defun largest-factor (number)
  number)
