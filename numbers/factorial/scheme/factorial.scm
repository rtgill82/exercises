;
; Created:  Fri 16 Jun 2017 01:32:07 PM PDT
; Modified: Tue 20 Jun 2017 10:45:29 AM PDT
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
