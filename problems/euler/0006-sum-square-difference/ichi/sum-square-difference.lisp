(defpackage #:sum-square-difference
  (:use #:cl)
  (:export #:difference-up-to #:sum-squares #:square-sums #:range))
(in-package #:sum-square-difference)

(defun square (number)
  (* number number))

(defun range (limit)
  (loop for item from 1 to limit collect item))

(defun difference-up-to (limit)
  (- (square-sums (range limit)) (sum-squares (range limit))))

(defun sum-squares (list)
  (apply #'+ (mapcar #'(lambda (x) (square x)) list)))

(defun square-sums (list)
  (square (apply #'+ list)))
