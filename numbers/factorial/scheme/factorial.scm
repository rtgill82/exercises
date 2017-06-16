;
; Created:  Fri 16 Jun 2017 01:32:07 PM PDT
; Modified: Fri 16 Jun 2017 02:31:19 PM PDT
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
  (if (zero? n) 1
    (* n (factorial-recurse (1- n)))))
