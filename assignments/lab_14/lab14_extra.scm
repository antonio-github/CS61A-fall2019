
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
