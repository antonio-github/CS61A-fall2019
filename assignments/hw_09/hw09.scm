
; Tail recursion

(define (replicate x n)
    (define (replicated-list lst x n)
        (if (= n 0)
            lst
            (replicated-list (append (list x) lst) x (- n 1))
        )
    )
    (replicated-list nil x n)
  )

(define (accumulate combiner start n term)
    (if (= n 0)
        start
        (combiner (term n) (accumulate combiner start (- n 1) term))
    )
)

(define (accumulate-tail combiner start n term)
    (define (helper-acc n current-acc)
        ; Notice that lexical scope allows us to not to repeat COMBINER and TERM
        (if (= n 0)
            current-acc
            (helper-acc (- n 1) (combiner current-acc (term n)))
        )
    )
    (helper-acc n start)
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
    ; Check also the solution from the Solutions file. It does not create an 
    ; extra macro for MAP-STREAM but rather it passes itself! 
    (begin
        (define (naturals n)
            (cons-stream n (naturals (+ n 1)))
        )
        (map-stream (lambda (x) (* 3 x)) (naturals 1))
    )
)










; This does not work! Are streams mutable? If so, I don't know why this does not
; work...
;(define (nondecreastream s)
;    (define (get-car s val)
;        (if (or (null? s) (promise? (car s)) (< (car s) val))
;            nil
;            (cons (car s) (get-car (cdr-stream s) (car s)))
;        )
;    )
;    ;(print (promise? (car s)))
;    (if (or (null? s) (promise? (car s)))
;        nil
;        (cons-stream (get-car s (car s)) (nondecreastream (cdr-stream s)))
;    )
;)

(define (nondecreastream s)
    (if (null? s)
        nil
        (begin
            (define (rest) (nondecreastream (cdr-stream s)))
            (if (or (null? (cdr-stream s))
                    (> (car s) (car (cdr-stream s))))
                (cons-stream (list (car s)) (rest))
                (cons-stream (cons (car s) (car (rest)))
                          (cdr-stream (rest))
                )
            )
        )
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))
