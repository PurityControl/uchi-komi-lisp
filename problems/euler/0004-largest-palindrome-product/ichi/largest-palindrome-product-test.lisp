(ql:quickload "lisp-unit")

(defpackage #:largest-palindrome-product-test
  (:use #:common-lisp #:lisp-unit))

(load "largest-palindrome-product")

(in-package #:largest-palindrome-product-test)

(define-test product-for-1-to-3
  (assert-equal '(1 2 3 2 4 6 3 6 9) (largest-palindrome-product:products 1 3)))

(define-test product-for-1-to-5
  (assert-equal '(1 2 3 4 5 2 4 6 8 10 3 6 9 12 15 4 8 12 16 20 5 10 15 20 25)  
		(largest-palindrome-product:products 1 5)))

(define-test product-length-for-1-to-3
  (assert-equal 9 (length (largest-palindrome-product:products 1 3))))

(define-test product-length-for-1-to-10
  (assert-equal 100 (length (largest-palindrome-product:products 1 10))))

(define-test product-length-for-1-to-20
  (assert-equal 400 (length (largest-palindrome-product:products 1 20))))

(define-test palindrome-p-true
  (assert-true (largest-palindrome-product:palindrome-p 9339)))

(define-test palindrome-p-false
  (assert-false (largest-palindrome-product:palindrome-p 93391)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :largest-palindrome-product-test))
