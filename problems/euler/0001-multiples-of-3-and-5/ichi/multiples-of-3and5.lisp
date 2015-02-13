(defpackage #:multiples-of-3and5
  (:use #:cl)
  (:export #:to))
(in-package #:multiples-of-3and5)

(defun to (limit)
  "determine the sum of all numbers up to limit that are divisible by 3 or 5"
  (labels 
   ((divisible? (number)
		(or (zerop (mod number 3)) (zerop (mod number 5)))))
   (reduce #'+
	   (remove-if-not #'divisible?
			  (loop for i from 1 below limit by 1 collect i)))))

