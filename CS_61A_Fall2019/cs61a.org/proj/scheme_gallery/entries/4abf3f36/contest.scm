;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: The Process of Humility
;;;
;;; Description:
;;;   <There's no "god" or "king"
;;;    of a place for helping out
;;;    I'm just being kind>

(define (setup)
  (bgcolor "#5590bc")
  (color "white")
  (speed 0)
  (fd 500)
  (bk 1000)
  (fd 500)
  (rt 90)
  (fd 500)
  (bk 1000)
  (fd 500)
  (lt 90)
)

(define (cross)
  (pu)
  (setposition -300 70)
  (pd)
  (rt 45)
  (width 20)
  (color "red")
  (fd 280)
  (bk 140)
  (lt 90)
  (fd 140)
  (bk 280)
  (width 1)
  (setheading 0)
  (color "white")
)

(define (p_logo)
  (pu)
  (setposition 250 180)
  (begin_fill)
  (pd)
  (circle 70)
  (pu)
  (end_fill)
  (color "#5590bc")
  (setposition 230 180)
  (begin_fill)
  (pd)
  (circle 50)
  (end_fill)
  (pu)
  (setposition 120 180)
  (pd)
  (color "white")
  (width 20)
  (bk 150)
  (pu)
  (fd 200)
  (width 2)
  (color "yellow")
  (pd)
  (begin_fill)
  (fd 80)
  (rt 135)
  (fd 40)
  (lt 90)
  (fd 40)
  (rt 90)
  (fd 40)
  (lt 90)
  (fd 40)
  (lt 45)
  (bk 80)
  (lt 90)
  (fd 110)
  (end_fill)
  (pu)
  (setposition 203 260)
  (color "#948365")
  (rt 90)
  (pd)
  (begin_fill)
  (circle 25)
  (end_fill)
  (setposition 175 245)
  (color "white")
  (lt 45)
  (fd 15)
  (bk 15)
  (rt 85)
  (fd 30)
)

(define (checkmark)
  (pu)
  (setposition -240 -270)
  (color "#00ff00")
  (width 20)
  (pd)
  (lt 90)
  (fd 100)
  (bk 100)
  (rt 85)
  (fd 250)
)

(define (good_answer)
  (pu)
  (setposition 240 -210)
  (color "#8cc63f")
  (setheading 0)
  (width 10)
  (pd)
  (begin_fill)
  (fd 120)
  (lt 90)
  (fd 120)
  (lt 90)
  (fd 120)
  (lt 90)
  (fd 120)
  (end_fill)
  (setposition 180 -100)
  (color "white")
  (lt 180)
  (circle 25 180)
  (rt 180)
  (circle 25 -180)
  (setposition 165 -192)
  (color "#fab551")
  (lt 135)
  (fd 45)
  (bk 45)
  (rt 85)
  (fd 95)
)

(define (draw)
  ; YOUR CODE HERE
  (setup)
  (cross)
  (p_logo)
  (checkmark)
  (good_answer)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)