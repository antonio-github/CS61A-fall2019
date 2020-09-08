;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Fibonacci in Bloom
;;;
;;; Description:
;;;   A pleasant river
;;;    Spirals in the sky and trees
;;;    Sit and rest a while
(define pi 3.14159)
(define e 2.71828)

(define (fib_curve ox oy step_count step_size t a b r flip)
  (setposition (+ ox (* flip (fib_x a b t r))) (+ oy (fib_y a b t r)))
  (if (> step_count 0)
    (fib_curve ox oy (- step_count 1) step_size (+ t step_size) a b r flip)
  )
)

(define (cloud_curve ox oy step_count step_size t a b r flip)
  (color (rgb 1 1 1))
  (setposition (+ ox (* flip (fib_x a b t r))) (+ oy (fib_y a b t r)))
  (begin_fill)
  (circle (* 0.2 t t))
  (end_fill)
  (if (> step_count 0)
    (cloud_curve ox oy (- step_count 1) step_size (+ t step_size) a b r flip)
  )
)

(define (fib_x a b t r)
  (* a (expt e (* t b)) (cos (+ t r)))
)

(define (fib_y a b t r)
  (* a (expt e (* t b)) (sin (+ t r)))
)

(define (fib_row ix iy fx fy tree_count s_c s_s a b flip scale stop)
  (if (> tree_count 0)
    (begin
      (penup)
      (setposition (+ ix (/ (- fx ix) scale)) (+ iy (/ (- fy iy) scale)))
      (fib_row (+ ix (/ (- fx ix) scale)) (+ iy (/ (- fy iy) scale)) fx fy (- tree_count 1) s_c s_s (* a (- 1 (/ 1 scale))) b flip scale stop)
      (penup)
      (setposition ix iy)
      (pendown)
      (if (< tree_count stop)
      (tree ix iy s_c s_s a b flip 2 a)))

  )
)
(define (branch_x a b s_c s_s flip)
  (- (* flip (fib_x a b (* s_c s_s 0.95) (* 0.8 pi))) (* -1 flip (fib_x (/ a 2) b (* s_c s_s) (* 0.8 pi))))
)

(define (branch_y a b s_c s_s)
  (- (fib_y a b (* s_c s_s 0.95) (* 0.8 pi)) (fib_y (/ a 2) b (* s_c s_s) (* 0.8 pi)))
)

(define (leaves np angle scale)
  (color (rgb 0.467 0.867 0.467))
  (penup)
  (setheading (/ angle -2))
  (define (petal count)
    (if (> count 0) (begin
      (setheading (+ (/ angle -2) (* (/ angle (- np 1)) (- np count -1))))
      (forward scale)
      (pendown)
      (begin_fill)
      (circle (* 1.5 scale))
      (end_fill)
      (color (rgb 0.467 0.867 0.467))
      (penup)
      (backward scale)
      (petal (- count 1))
      (if (> count 1) (begin
        (setheading (+ (/ angle -2) (* (/ angle (- np 1)) (- np count -1))))
        (penup)
        (forward (* scale 1.5))
        (flower 5 (/ scale 5))
        (penup)
        (backward (* scale 1.5))))
    ))
  )
  (petal np)
  (penup)
  (setheading (/ angle -2))
  (forward (* scale 1.5))
  (flower 5 (/ scale 5))
  (penup)
  (backward (* scale 1.5))
  (pendown)
)

(define (tree x y s_c s_s a b flip depth fa)
  (color (rgb 0.514 0.412 0.325))
  (begin_fill)
  (fib_curve x y s_c s_s 0 a b (* pi 0.79) flip)
  (penup)
  (setposition x y)
  (pendown)
  (fib_curve x y s_c (* s_s 0.9965) 0 a b (* pi 0.81) flip)
  (setposition (+ x (* flip (fib_x a b (* s_c s_s) (* pi 0.79)))) (+ y (fib_y a b (* s_c s_s) (* pi 0.79))))
  (end_fill)
  (penup)
  (setposition (+ x (* flip (fib_x a b 1 (* pi 0.81)))) (+ y (fib_y a b 1 (* pi 0.81))))
  (pendown)
  (leaves 5 200 (* fa 100))
  (flower 5 (* fa 20))
  (if (> depth 0) (begin
    (penup)
    (setposition (+ x (branch_x a b s_c s_s flip)) (+ y (branch_y a b s_c s_s)))
    (pendown)
    (tree (+ x (branch_x a b s_c s_s flip)) (+ y (branch_y a b s_c s_s)) s_c s_s (/ a 2) b (* -1 flip) (- depth 1) fa)
  ))
)

(define (flower np scale)
  (color (rgb 1 0.82 0.863))
  (penup)
  (define (petal count)
    (if (> count 0) (begin
      (forward scale)
      (pendown)
      (begin_fill)
      (circle scale)
      (end_fill)
      (penup)
      (backward scale)
      (right (/ 360 np))
      (petal (- count 1))
    ))
  )
  (petal np)
  (pendown)
)

(define (draw)
  (speed 0)
  (bgcolor (rgb 0.678 0.847 0.902))
  (penup)
  (setposition -1000 -600)
  (begin_fill)
  (color (rgb 0.012 0.753 0.235))
  (setposition 1000 -600)
  (setposition 1000 175)
  (setposition -1000 175)
  (end_fill)
  (penup)
  (setposition -600 -600)
  (pendown)
  (color (rgb 0.467 0.62 0.796))
  (begin_fill)
  (setposition 0 175)
  (setposition 600 -600)
  (setposition -600 -600)
  (end_fill)
  (penup)
  ;
  (color (rgb 0.322 0.518 0.741))
  (setposition 150 -200)
  (pendown)
  (fib_curve 150 -200 135 0.05 1 0.3 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition -250 -240)
  (pendown)
  (fib_curve -250 -240 130 0.05 1 0.5 0.8 (* 0.6 pi) -1)
  (penup)
  (setposition -50 -400)
  (pendown)
  (fib_curve -50 -400 130 0.05 1 0.7 0.8 (* 0.6 pi) -1)
  (penup)
  (setposition -80 -100)
  (pendown)
  (fib_curve -80 -100 130 0.05 1 0.2 0.8 (* 0.6 pi) -1)
  (penup)
  (setposition 80 0)
  (pendown)
  (fib_curve 80 0 135 0.05 1 0.12 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition -20 50)
  (pendown)
  (fib_curve -20 50 135 0.05 1 0.1 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition -15 80)
  (pendown)
  (fib_curve -15 80 135 0.05 1 0.08 0.8 (* 0.6 pi) -1)
  (penup)
  (setposition 20 100)
  (pendown)
  (fib_curve 20 100 135 0.05 1 0.06 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition 0 120)
  (pendown)
  (fib_curve 0 120 135 0.05 1 0.05 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition -5 135)
  (pendown)
  (fib_curve -5 135 135 0.05 1 0.03 0.8 (* 0.6 pi) -1)
  (penup)
  (setposition 3 150)
  (pendown)
  (fib_curve 3 150 135 0.05 1 0.02 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition -1 160)
  (pendown)
  (fib_curve -1 160 135 0.05 1 0.01 0.8 (* 0.5 pi) 1)
  (penup)
  (setposition -2 167)
  (pendown)
  (fib_curve -2 167 135 0.05 1 0.005 0.8 (* 0.6 pi) -1)
  (penup)
  ;
  (setposition 150 200)
  (cloud_curve 30 400 260 0.05 0 0.3 0.5 (* pi 0.75) 1)
  (cloud_curve -105 280 235 0.05 0 0.6 0.5 (* pi 0.7) -1)
  (cloud_curve 500 340 250 0.05 0 0.6 0.5 (* pi 0.3) -1)
  (cloud_curve -735 450 280 0.05 0 0.4 0.7 (* pi 0.75) 1)
  ;
  (fib_row -60500 -300 0 175 14 156 0.05 0.6 1 1 2.5 6)
  (fib_row -54500 -300 0 175 14 156 0.05 0.6 1 1 2.5 6)
  (fib_row -48500 -300 0 175 14 156 0.05 0.6 1 1 2.5 6)
  (fib_row -42500 -300 0 175 14 156 0.05 0.6 1 1 2.5 7)
  (fib_row -36500 -300 0 175 14 156 0.05 0.6 1 1 2.5 7)
  (fib_row -30500 -300 0 175 14 156 0.05 0.6 1 1 2.5 8)
  (fib_row -24500 -300 0 175 14 156 0.05 0.6 1 1 2.5 9)
  (fib_row -18500 -300 0 175 14 156 0.05 0.6 1 1 2.5 9)
  (fib_row -12500 -300 0 175 14 156 0.05 0.6 1 1 2.5 10)
  (fib_row -6500 -300 0 175 14 156 0.05 0.6 1 1 2.5 11)
  (fib_row -500 -300 0 175 14 156 0.05 0.6 1 1 2.5 15)
  (fib_row 60500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 6)
  (fib_row 54500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 6)
  (fib_row 48500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 6)
  (fib_row 42500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 7)
  (fib_row 36500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 7)
  (fib_row 30500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 8)
  (fib_row 24500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 9)
  (fib_row 18500 -600 0 175 14 156 0.05 0.6 1 -1 2.5 9)
  (fib_row 12500 -600 0 175 14 156 0.05 0.6 1 -1 2.5 10)
  (fib_row 6500 -600 0 175 14 156 0.05 0.6 1 -1 2.5 11)
  (fib_row 500 -300 0 175 14 156 0.05 0.6 1 -1 2.5 15)
  (hideturtle)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
