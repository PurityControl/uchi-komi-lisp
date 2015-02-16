
(defpackage #:largest-prime-factor
  (:use #:cl)
  (:export #:largest-factor #:primes-to))
(in-package #:largest-prime-factor)

(defun primes-to (number)
  "determine the largest prime factor for number"
  (labels ((natural-numbers (number)
                  (loop for x from 2 to number
                        collect x))
           (divisible-p (factor)
                        (lambda (x) (zerop (mod x factor))))
           (seive (primes bucket)
                  (if (null bucket)
                      primes
                    (let* ((prime (car bucket))
                           (new-bucket (remove-if (divisible-p prime) (cdr bucket))))
                      (seive (cons prime primes)
                             new-bucket)))))
          (let ((number-bucket (natural-numbers number)))
            (seive '() number-bucket))))

(defun largest-factor (number)
  (let* ((primes (copy-list (primes-to number)))
         (prime-factors 
          (remove-if-not #'(lambda (x) (zerop (mod number x))) primes)))
    (print prime-factors)))
 
