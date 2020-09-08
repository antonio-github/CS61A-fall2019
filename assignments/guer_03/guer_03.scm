
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Scheme          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Q1.1

; scm> (and 0 2 200)
; 200
; scm> (or True (/ 1 0))
; #t
; scm> (and False (/ 1 0))
; #f
; scm> (not 3)
; #f


; Q1.2

; scm> (define a (+ 1 2))
; a
; scm> a
; 3
; scm> (define b (+ (* 3 3) (* 4 4)))
; b
; scm> (+ a b)
; 28
; scm> (= (modulo 10 3) (quotient 5 3))
; True
; scm> (even? (+ (- (* 5 4) 3) 2))
; False
; scm> (if (and #t (/ 1 0)) 1 (/ 1 0))
; Error
; scm> (if (> (+ 2 3) 5) (+ 1 2 3 4) (+ 3 4 (* 3 2)))
; 13
; scm> ((if (< 9 3) + -) 4 100)
; -96
; scm> (if 0 #t #f)
; #t


; Q1.3

(define (cat meow purr)
  (+ meow purr)
)

(define cat (lambda (meow purr) (+ meow purr)))


; Q1.4

; Fixed code:
(define (sum-every-other lst)
  (cond
    ((null? lst) 0) ; null changed to 0.
    ((null? (cdr lst)) (car lst)) ; added new base case: null cdr of lst.
    (else (+ (car lst) (sum-every-other (cdr (cdr lst))) ))
    ; changed nearly everything.
  )
)   ; parenthesis added.


; Q1.5

(define (sixty-ones lst)
  (cond
    ((< (len lst) 2)
      0)
    ((and (= (car lst) 6) (= (car (cdr lst)) 1))
      (+ 1 (sixty-ones (cdr lst))) )
    (else
      (sixty-ones (cdr lst)) )
  )
)


; Q1.6

(define (no-elevens n)
  (cond
    ((= n 0)
      '(()))
    ((= n 1)
      '((6) (1)))
    (else
      (append
        (add-to-all 6 (no-elevens (- n 1)))
        (add-to-all 1 (add-to-all 6 (no-elevens (- n 2))))
        ; Without defining a helper function it is not possible to keep track
        ; of the previous value (6 or 1), thus if we add a 1 we need to also
        ; add a 6 in the same step, decreasing n by 2. Also, for this reason,
        ; it is a needed a new base case for n=1 (substracting 2 is invalid).
      )
    )
  )
)


; Q1.7
; This exercise was not possible to do without knowing BEGIN structures,
; therefore I was not able to do it.
(define (remember f)
  (define remembered? #f)
  (defined remembered nil)
  (lambda ()
    (if remembered?
      remembered
      (begin
        (set! remembered (f))
        (set! remembered? #t)
        remembered
      )
    )
  )
)
; Using BEGIN it is possible to have something similar to a set of statements,
; but it returns the last one.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Scheme Lists          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Q2.1

; 1
;   2
;     3
;     4
;       5
;         6
;       7

; scm> (cdr nested-lst)
; ((2 3) (4 5 6) 7)
; scm> (cdr (car (cdr nested-lst)))
; (3)
; scm> (cons (car nested-list) (car (cdr (cdr nested-list))))
; (1 4 5 6)
