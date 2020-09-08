(define (partial-sums stream)
  (define (helper partial-sum s)
		(if (null? s)
			nil
			(cons-stream
				(+ (car s) partial-sum)
				(helper (+ (car s) partial-sum) (cdr-stream s))
			)
		)
	)
  (helper 0 stream)
)
