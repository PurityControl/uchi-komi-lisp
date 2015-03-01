(ql:quickload "lisp-unit")

(defpackage #:largest-palindrome-product-test
  (:use #:common-lisp #:lisp-unit))

(load "largest-palindrome-product")

(in-package #:largest-palindrome-product-test)

(define-test product-for-1-to-3
  (assert-equal '(9 6 3 6 4 2 3 2 1) (largest-palindrome-product:products 1 3)))

(define-test product-for-1-to-5
  (assert-equal '(25 20 15 10 5 20 16 12 8 4 15 12 9 6 3 10 8 6 4 2 5 4 3 2 1)  
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

(define-test largest-palindrome-product-2-digit
  (assert-equal 9009 
		(largest-palindrome-product:largest-palindrome-product 10 99)))

(define-test largest-palindrome-product-3-digit
  (assert-equal 906609 
		(largest-palindrome-product:largest-palindrome-product 100 999)))

(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :largest-palindrome-product-test))
