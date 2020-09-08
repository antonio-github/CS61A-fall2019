
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q3.1              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; scm> (define a (+ 1 2))
; a
; scm> a
; 3
; scm> (define b (+ (* 3 3) (* 4 4)))
; b
; scm> (+ a b)
; 28
; scm> (= (modulo 10 3) (quotient 5 3))
; #t
; scm> (even? (+ (- (* 5 4) 3) 2))
; #f


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q4.1              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; scm> (if (or #t (/ 1 0)) 1 (/ 1 0))
; 1
; scm> (if (> 4 3) (+ 1 2 3 4) (+ 3 4 (* 3 2)))
; 10
; scm> ((if (< 4 3) + -) 4 100)
; -96
; scm> (if 0 1 2)
; 1         ; 0 is True in Scheme!


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q4.1              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (factorial x)
  (if (< x 2)
    1
    (* x (factorial (- x 1)))
    )
  )


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q4.2              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fib n)
  (cond
    ((= n 0)
      0)
    ((= n 1)
      1)
    (else
      (+ (fib (- n 1)) (fib (- n 2))))
  )
)


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q5.1              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Resource-demanding solution:
(define (my-append a b)
  (cond
    ((not (null? a))
      (cons (car a) (my-append (cdr a) b)))
    ((not (null? b))
      (cons (car b) (my-append a (cdr b))))
    (else
      a)
  )
)

; Simpler solution:
(define (my-append a b)
  (if (null? a)
    b
  (cons (car a) (my-append (cdr a) b))
  )
)


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q5.2              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (replicate x n)
  (if (= n 0)
    nil
  (cons x (replicate x (- n 1)))
  )
)


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q5.3              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (uncompress s)
  (if (null? s)
    s
  (my-append
    (replicate (car(car s)) (car (cdr (car s))))
    (uncompress (cdr s))
  )
  )
)


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q6.1              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (map fn lst)
  (if (null? lst)
    lst
  (cons (fn (car lst)) (map fn (cdr lst)))
  )
)


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              Q6.2              ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-tree label branches) (cons label branches))

(define (label tree) (car tree))

(define (branches tree) (cdr tree))
