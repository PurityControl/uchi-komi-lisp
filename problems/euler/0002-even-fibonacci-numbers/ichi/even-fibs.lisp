(defpackage #:even-fibs
  (:use #:cl)
  (:export #:to))
(in-package #:even-fibs)

(defun to (limit)
  "determine the sum of all even fibonacci numbers up to and including limit"
  (labels 
   ((fibs-to (1st 2nd limit)
             (if (<= limit 1st)
                 '()
               (cons 1st (fibs-to 2nd (+ 1st 2nd) limit)))))
   (let ((even-fibs (remove-if-not #'evenp (fibs-to 1 2 limit))))
     (apply #'+ even-fibs))))

