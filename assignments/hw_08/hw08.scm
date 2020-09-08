; Macros

(define-macro (list-of map-expr for var in lst if filter-expr)
; Idea: filter LST using FILTER-EXPR to create a filtered list. Now, use this
; list as input list for MAP.
; Note: VAR must be bind in lambda exprs to the variable, because
; MAP-EXPR and FILTER-EXPR are defined in terms of VAR.
	`(map
		(lambda (,var) ,map-expr)
		(filter
			(lambda (,var) ,filter-expr)
			,lst
		)
	)
)
