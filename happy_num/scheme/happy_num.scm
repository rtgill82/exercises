;
; Created:  Fri 02 Jun 2017 12:36:50 PM PDT
; Modified: Mon 05 Jun 2017 11:33:45 PM PDT
;
; Find the first 8 happy numbers
; Author: Robert Gill <locke@sdf.lonestar.org>
; Copyright 2017 (C) Robert Gill
;

(define NUM 2)
(define MAX 8)

(define (sum-sqr-digits num)
  (sum-sqr-digits-recurse num 0))

(define (sum-sqr-digits-recurse num sum)
  (if (zero? num) sum
    (let ((digit (modulo num 10)))
      (sum-sqr-digits-recurse (quotient num 10)
			      (+ sum (* digit digit))))))

(define (happyp num)
  (let ((num (sum-sqr-digits num)))
    (if (and (not (eq? num 1)) (> num 9))
      (happyp num)
      (eq? num 1))))

(define (list-happy-nums start)
  (list-happy-nums-recurse start 0))

(define (list-happy-nums-recurse num count)
  (if (>= count MAX) '()
    (if (happyp num)
      (begin (display num) (display " is a Happy Number!")
	     (newline)
	     (list-happy-nums-recurse (1+ num) (1+ count)))
      (list-happy-nums-recurse (1+ num) count))))

(list-happy-nums NUM)
