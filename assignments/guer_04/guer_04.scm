
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 1. Tail Recursion

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Q1.1          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;

; Multiplies x by y
(define (mult x y)
    (if (= 0 y)
        0
        (+ x (mult x (- y 1)))
    )
)
; Not tail recursive (tr). "(+ x (mult x (- y 1))" is not in a tail environment.

(define (mult-tr x y)
    (define (helper-mult x y total)
        (if (= y 0)
            total
            (helper-mult x (- y 1) (+ x total))
        )
    )
    (helper-mult x y 0)
)

; Tests for mult and mult-tr
;(mult 5 3)
;(mult-tr 5 3)
;(mult 65 0)
;(mult-tr 65 0)


; Always evaluates to true
; assume n is positive
(define (true1 n)
    (if (= n 0)
        #t
        (and #t (true1 (- n 1)))
    )
)
; Tail recursive. The recursive call is in a tail environment (last elem of AND)


; Always evaluates to true
; assume n is positive
(define (true2 n)
    (if (= n 0)
        #t
        (or (true2 (- n 1)) #f)
    )
)
; Not TR. The recursive call is in the first elem of OR.
; To make it TR, change "(or (true2 (- n 1)) #f)" to "(or #f (true2 (- n 1)))"


; Returns true if x is in lst
(define (contains lst x)
    (cond
        ((null? lst) #f)
        ((equal? (car lst) x) #t)
        ((contains (cdr lst) x) #t)
        (else #f)
    )
)
; Not TR. The recursive call is in a predicate subexpression.

(define (contains-tr lst x)
    (cond
        ((null? lst) #f)
        ((equal? (car lst) x) #t)
        (else (contains (cdr lst) x))
    )
)

; Tests for contains and contains-tr
;(define lst '(1 2 3 4))
;(contains lst 3)
;(contains-tr lst 3)
;(contains lst 0)
;(contains-tr lst 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Q1.2          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum-satisfied-k lst f k)
    (define (sum-sofar lst k total)
        (cond
            ((= 0 k) 
                total
            )
            ((null? lst)
                0
            )
            ((f (car lst)) 
                (sum-sofar (cdr lst) (- k 1) (+ total (car lst)))
            )
            (else (sum-sofar (cdr lst) k total))
        )
    )
    (sum-sofar lst k 0)
)

; Doctests
;(define lst `(1 2 3 4 5 6))
;(sum-satisfied-k lst even? 2)  ; 2 + 4
;(sum-satisfied-k lst (lambda(x) (= 0 (modulo x 3))) 10)
;(sum-satisfied-k lst (lambda(x) #t) 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Q1.3          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (remove-range lst i j)
    (define (helper-remover lst new-lst i j)
        (cond
            ((< j 0) (append new-lst lst))
            ((= i 0) (helper-remover (cdr lst) new-lst 0 (- j 1)))
            (else 
                (helper-remover 
                    (cdr lst)
                    (append new-lst (list (car lst)))
                    (- i 1)
                    (- j 1)
                )
            )
        )
    )
    (helper-remover lst nil i j)
)

; Doctests 
;(remove-range '(0 1 2 3 4) 1 3)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 3. Macros

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Q3.1          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;


;(define-macro (doierror) (/ 1 0))
; doierror
;(doierror)
; Error
;(define x 5)
; x
;(define-macro (evaller y) (list (list 'lambda '(x) 'x) y))
; evaller
;(evaller 2)
; 2


;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Q3.2          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(begin (list (+ 2 2) (print 'a)))

; implement WHEN without using quasiquotes

(define-macro (when cond . exprs)
    (list 'if cond
        (cons 'begin exprs)
        ''okay
    )
)

; implement WHEN using quasiquotes
(define-macro (when cond . exprs)
    `(if ,cond
        ,(cons 'begin exprs)
        (quote okay)
    )
)

; Doctests
;(when (= 1 0)(/1 0) 'error)
;(when (= 1 1) (print 6) (print 1) 'a)


