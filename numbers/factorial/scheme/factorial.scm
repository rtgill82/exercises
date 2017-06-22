;
; Created:  Fri 16 Jun 2017 01:32:07 PM PDT
; Modified: Wed 21 Jun 2017 05:37:40 PM PDT
;
; Copyright 2017 (C) Robert Gill
;

(define (factorial-iter n)
  (let ((product 1))
    (do ((i n (1- i)))
        ((= i 1))
      (set! product (* i product)))
    product))

(define (factorial-recurse n)
  (define (f n product)
    (if (zero? n) product
      (f (1- n) (* n product))))
  (f n 1))

(display "Enter a number: ")
(let ((num (read)))
  (display "Iterative: ")
  (display (factorial-iter num))(newline)
  (display "Recursive: ")
  (display (factorial-recurse num))(newline))
