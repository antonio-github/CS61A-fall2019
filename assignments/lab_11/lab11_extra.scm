
(define-macro (switch expr cases)
; Note: wrote " ,expr (quote ,value) " in order to pass string equality tests.
; By simply evaluating VALUE, it returns an error for one test.
	(let
		(
		(value (car (car cases)))
		(true-expr (car (cdr (car cases))))
		(rest-cases (cdr cases))
		)
		`(if (eq? ,expr (quote ,value))
		    ,true-expr
			(switch ,expr ,rest-cases)
		)
	)
)

(define (flatmap f x)
  'YOUR-CODE-HERE)

(define (expand lst)
  'YOUR-CODE-HERE)

(define (interpret instr dist)
  'YOUR-CODE-HERE)

(define (apply-many n f x)
  (if (zero? n)
      x
      (apply-many (- n 1) f (f x))))

(define (dragon n d)
  (interpret (apply-many n expand '(f x)) d))
