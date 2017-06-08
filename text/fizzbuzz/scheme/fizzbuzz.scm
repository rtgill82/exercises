;
; Created:  Thu 08 Jun 2017 12:23:18 PM PDT
; Modified: Thu 08 Jun 2017 12:40:11 PM PDT
;
; Copyright 2017 (C) Robert Gill
;

(define (fizzbuzz num)
  (let ((m3 (modulo num 3))
	(m5 (modulo num 5)))
    (if (zero? m3) (display "Fizz"))
    (if (zero? m5) (display "Buzz"))
    (if (and (not (zero? m3)) (not (zero? m5)))
      (display num)) (newline)))

(define (for start end func)
  (if (> start end) '()
    (begin (func start)
	   (for (1+ start) end func))))

(for 1 100 fizzbuzz)
