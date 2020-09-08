
;;;;;;;;;;;;;;;;;
;     Q 1.1     ;
;;;;;;;;;;;;;;;;;

(define-macro (make-lambda expr)
    `(lambda () ,expr)
)

;(make-lambda(print'hi))
;(make-lambda (/ 1 0))
;(define print-3 (make-lambda (print 3)))
;(print-3)


;;;;;;;;;;;;;;;;;
;     Q 1.2     ;
;;;;;;;;;;;;;;;;;

(define (replicate x n)
    (if (= n 0) 
        nil
        (cons x (replicate x (- n 1)))
    )
)

(define-macro (repeat-n expr n)
; Note 1: BEGIN returns the last evaluated element of a set of expressions. Here 
; the last element is NIL becuse we are creating a list with first element
; BEGIN and the second element the return value of REPLICATE.
; Note 2: when using CONS Scheme will execute the first element and the second.
; So, if we quote everything, when evaluating the macro, it will evaluate BEGIN 
; and it will print an error saying that BEGIN is not defined (because it treats
; it as a name). The same happens using IF, etc. What we want is a list with 
; the set of characters BEGIN as the first element (not its value) and the rest.
    (cons 'begin (replicate expr (eval n)))
)

; Doubt: why " (cons 'begin (replicate expr (eval n))) " is correct but
; " `(cons begin (replicate ,expr ,(eval n))) " not? It thinks that BEGIN is a
; variable, not the symbol begin.

; (repeat-n (print'(resistance is futile)) 3)


;;;;;;;;;;;;;;;;;
;     Q 1.3     ;
;;;;;;;;;;;;;;;;;

(define-macro (or-macro expr1 expr2)
    `(let
        ((v1 ,expr1))
        (if v1
            v1
            ,expr2
        )
    )
)

; Doubt: why can we left LET and IF quoted alongside the rest of the expression
; but before we couldn't with BEGIN? I am not seeing something obvious!

;(or-macro (print'bork) (/ 1 0))
;(or-macro (= 1 0) (+ 1 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;     Q 2.1     ;
;;;;;;;;;;;;;;;;;

(define (has-even? s)
    (cond
        ((null? s) #f)
        ((even? (car s)) #t)
        (else (has-even? (cdr-stream s)))
    )
)
; has-even?
(define(f x) (* 3 x))
; f
(define nums 
    (cons-stream 1 
        (cons-stream (f 3) 
            (cons-stream (f 5) nil)
        )
    )
)
; nums
nums
; (1 . #[promise (not forced)]
(cdr nums)
; #[promise (not forced)]
(cdr-stream nums)
; (9 . #[promise (not forced)])
nums
; (1 . #[promise (forced)])
(define (f x) (* 2 x))
; f
(cdr-stream nums)
; (9 . #[promise (not forced)])
(cdr-stream (cdr-stream nums))
; (10 . #[promise (not forced)])
(has-even? nums) ; s = (1 . 9 . 10 . #[promise (not forced)])
; #t


;;;;;;;;;;;;;;;;;
;     Q 2.2     ;
;;;;;;;;;;;;;;;;;

; In the second case REST is always computed before CONS-STREAM. Therefore, if 
; the stream is infinite, it will result in infinite recursion.


;;;;;;;;;;;;;;;;;
;     Q 2.3     ;
;;;;;;;;;;;;;;;;;

(define (map-stream f s)
; Notice the CDR-STREAM S at recursive call. We need to pass a stream as 
; argument, not a promise. The first element must therefore be evaluated.
    (if (null? s)
        nil
        (cons-stream (f (car s)) (map-stream f (cdr-stream s)))
    )
)

(define (naturals n)
    (cons-stream n (naturals (+ n 1)))
)
(define nat (naturals 0))
(define evens (map-stream (lambda(x) (* x 2)) nat))
(car (cdr-stream evens))


;;;;;;;;;;;;;;;;;
;     Q 2.3     ;
;;;;;;;;;;;;;;;;;

(define (slice s start end)
    (cond 
        ((or (null? s) (= end 0))
            nil
        )
        ((<= start 0)
            (cons 
                (car s) 
                (slice (cdr-stream s) (- start 1) (- end 1))
            )
        )
        (else
            (slice (cdr-stream s) (- start 1) (- end 1))
        )
    )
)

;(define nat (naturals 0))
;(slice nat 4 12)


;;;;;;;;;;;;;;;;;
;     Q 2.4     ;
;;;;;;;;;;;;;;;;;

(define (combine-with f xs ys)
    (if (or(null? xs) (null? ys))
        nil
        (cons-stream
            (f (car xs) (car ys))
            (combine-with f (cdr-stream xs) (cdr-stream ys))
        )
    )
)

(define factorials
    (cons-stream 1 (combine-with * (naturals 1) factorials))
)
;(slice factorials 0 10)

(define fibs
    (cons-stream 
        0 
        (cons-stream 
            1 
            (combine-with + (cdr-stream fibs) fibs)
        )
    )
)
;(slice fibs 0 10)

(define (constants x)
    (cons-stream x (constants x))
)

(define (powers x)
    (cons-stream 1 (combine-with * (constants x) (powers x)))
)

;; Test for powers.
;(slice (powers 5) 0 5)


(define (taylor-exp x)
    ; Stream of elements in the Taylor series expansion of exp(x)
    ; Define (tailor-exp x) as division of a functions that returns a streams,  
    ; (powers x), and a stream, (factorials) .
    (combine-with / (powers x) factorials)
)

(define (exp x)
    (let
        ((taylor-exp-x (taylor-exp x)))
        (cons-stream 
            (car taylor-exp-x) 
            (combine-with + (cdr-stream taylor-exp-x) (exp x))
        )
    )
)

; Much simpler solution:
(define (exp x)
    (let
        ((terms (combine-with 
                    (lambda(a b) (/ (expt x a) b))
                    (cdr-stream (naturals 0))
                    (cdr-stream factorials))))
        (cons-stream 1 (combine-with + terms (exp x)))
    )
)

(slice (exp 1) 0 10)
