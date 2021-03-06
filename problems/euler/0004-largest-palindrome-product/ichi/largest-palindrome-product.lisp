(defpackage #:largest-palindrome-product
  (:use #:cl)
  (:export #:products #:palindrome-p #:largest-palindrome-product))
(in-package #:largest-palindrome-product)

(defun products (start end)
  (labels ((acc-prods (pr1 pr2 products)
	     (let ((product (* pr1 pr2)))
	       (cond 
		 ((and (eq pr1 end) (eq pr2 end)) (cons product products))
		 ((eq pr2 end) 
		  (acc-prods (1+ pr1) start (cons product products)))
		 (t (acc-prods pr1 (1+ pr2) (cons product products)))))))
    (acc-prods start start '())))

(defun palindrome-p (number)
  (let ((num (write-to-string number)))
    (string= num (reverse num))))

(defun largest-palindrome-product (start end)
  (apply #'max
	 (remove-if-not #'palindrome-p (products start end))))
