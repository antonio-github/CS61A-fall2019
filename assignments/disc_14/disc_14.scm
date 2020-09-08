
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     6. Streams
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Q6.1

(define (merge s1 s2)
    (if (< (car s1) (car s2))
        (cons-stream (car s1) (merge (cdr-stream s1) s2))
        (cons-stream (car s2) (merge s1 (cdr-stream s2)))
    )
)


; Q6.2

(define (cycle start)
    (cons-stream start (cycle (modulo (+ start 2) 5)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     7. Macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Q7.1

(define-macro (when condition exprs)
    (list 'if condition
        (cons 'begin exprs)
        '(quote okay)
    )
)

(define-macro (when condition exprs)
    `(if ,condition
        (,cons begin ,exprs)
        'okay
    )
)


; Q7.2

; Quasiquotation:
; - Without comma: literal words.
; - With comma: lookup expressions but not evaluating it.
; - With eval and comma: actual evaluation.
; Lists/cons:
; - With quote: literal words.
; - Nothing (no quote): lookup expressions.
; - With eval: evaluate.
(define-macro (zero-cond clauses)
    (cons 'cond
        (map
            (lambda (clause) `(not (= 0 ,(car clause))) (cdr clause)) )
            clauses
        )
    )
)
