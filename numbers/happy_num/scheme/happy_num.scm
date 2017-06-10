;
; Created:  Fri 02 Jun 2017 12:36:50 PM PDT
; Modified: Sat 10 Jun 2017 04:20:29 PM PDT
;
; Copyright 2017 (C) Robert Gill
;

(define START 2)
(define MAX 8)

(define (sum-sqr-digits num)
  (define (sum-sqr-digits-r num sum)
    (if (zero? num) sum
      (let ((digit (modulo num 10)))
	(sum-sqr-digits-r (quotient num 10)(+ sum (* digit digit))))))
  (sum-sqr-digits-r num 0))

(define (happyp num)
  (let ((num (sum-sqr-digits num)))
    (if (and (not (eq? num 1)) (> num 9))
      (happyp num)
      (eq? num 1))))

(define (list-happy-nums start max)
  (define (list-happy-nums-r num count)
    (if (>= count max) '()
      (if (happyp num)
	(begin (display num) (display " is a Happy Number!")
	       (newline)
	       (list-happy-nums-r (1+ num) (1+ count)))
	(list-happy-nums-r (1+ num) count))))
  (list-happy-nums-r start 0))

(list-happy-nums START MAX)
