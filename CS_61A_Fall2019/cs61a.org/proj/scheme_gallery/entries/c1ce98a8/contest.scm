;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: nobody likes the cybertruck and no one likes me :(
;;;
;;; Description:
;;;   after midterm 1 and 2, i can no longer declare cs, boo-hoo
;;;   the window, shattered like my hopes and dreams
;;;   denero make the final easier, please?

(define (draw)
  ; YOUR CODE HERE
  (define x_f 0.5)
  (define y_f (- 0.5))
  (define x_o -600)
  (define y_o 200)
  (define (l x)
    (penup)
    (setposition (+ x_o (* x_f (quotient x 1000000000000))) (+ y_o (* y_f (modulo (quotient x 100000000) 10000))))
    (pendown)
    (setposition (+ x_o (* x_f (modulo (quotient x 10000) 10000))) (+ y_o (* y_f (modulo x 10000))))
  )

  (define (el x y a b s e)
    (penup)
    (setposition (+ x_o (* x_f (+ x (* a (cos s))))) (+ y_o (* y_f (+ y (* b (sin s))))))
    (pendown)
    (define (helper t)
      (if (<= e t)
      (penup)
        (begin (setposition (+ x_o (* x_f (+ x (* a (cos t))))) (+ y_o (* y_f (+ y (* b (sin t)))))) (helper (+ t 0.01)))
      )
    )
    (helper s)


  )

  ;(write 'MT1)
(l 0376028212810288)
(l 1281028817280020)
(l 1728002010470036)
(l 1047003603760282)
(l 0295030013340306)
(l 1334030617890005)
(l 1789000510390012)
(l 1039001202950300)
(l 0295030000260420)
(l 0026042000580462)
(l 0058046208140481)
(l 0814048111480432)
(l 1148043213340306)
(l 0026042400090478)
(l 0009047800420500)
(l 0042050008150518)
(l 0815051811390498)
(l 1139049811540439)
(l 1154043926370337)
(l 2637033721840140)
(l 2184014017910003)
(l 1373035022550305)
(l 2255030521930159)
(l 2193015918190031)
(l 1819003116230174)
(l 1623017416300333)
(l 1902006619590325)
(l 1376034816250174)
(l 0008047700240699)
(l 0024069900350709)
(l 0035070908440747)
(l 0844074711180756)
(l 1118075611430503)
(l 0043050900380708)
(l 0812051408440751)
(l 0022069900190729)
(l 0019072900400744)
(l 0040074408260769)
(l 0826076911150782)
(l 1115078211780778)
(l 1178077811190756)
(l 0007072200400741)
(l 0040074100320812)
(l 0032081200020765)
(l 0002076500060722)
(l 0032081308430853)
(l 0843085311610858)
(l 1161085811780780)
(l 0843085308310777)
(l 0036081000480875)
(l 0048087508670918)
(l 0867091811430913)
(l 1143091311600861)
(l 0868092108460855)
(l 0041087505080978)
(l 0508097810081012)
(l 1008101211030987)
(l 1103098711410917)
(l 1012101608690919)
(l 1119075512480499)
(l 1248049915380467)
(l 1538046715600513)
(l 1560051316230809)
(l 1623080916440401)
(l 1569051813080531)
(l 1308053111790779)
(l 1308053412420489)
(l 1624080622300747)
(l 2230074722840356)
(l 1953077120060383)
(l 1917040219170429)
(l 1917042919770429)
(l 1977042919770400)
(l 1977040019170402)
(l 2200038022000405)
(l 2200040522600405)
(l 2260040522600375)
(l 2260037522000380)
(l 1620080315960886)
(l 1596088623120822)
(l 2312082223610726)
(l 2361072622880733)
(l 2288073322530824)
(l 2253082421740834)
(l 2174083422280740)
(l 2228074022880734)
(l 2288073423870490)
(l 2387049025160486)
(l 2516048625570522)
(l 2557052225820713)
(l 2582071326020679)
(l 2602067926410340)
(l 2601067825760679)
(l 2556052324420528)
(l 2442052823590726)
(l 2385048724420527)
(l 1595088915910978)
(l 1591097822810889)
(l 2281088923130821)
(l 1439068913490751)
(l 1349075113240907)
(l 1324090713411053)
(l 1341105314101130)
(l 1410113015031121)
(l 1503112115641028)
(l 1564102815660814)
(l 1566081415210720)
(l 1521072014390689)
(l 2532066724800689)
(l 2480068924460833)
(l 2446083324850958)
(l 2485095825310970)
(l 2531097025740876)
(l 2574087625710748)
(l 2571074825320667)
(l 1416060412630612)
(l 1416122512611235)
(l 2489060324110607)
(l 2489104923461052)
(l 1808009318600202)
(l 1876013417840181)
(l 1835011318110190)
(l 1827019318550121)
(l 1795012218460177)
(l 1788015018720144)
(l 2060013520540207)
(l 2028022020500148)
(l 2000020621000152)
(l 2015014220790216)
(l 2020021721030181)
(l 1731027617420246)
(l 1742024617580266)
(l 1758026617670245)
(l 1767024517870270)
(l 1796024218210243)
(l 1811024218080273)
(l 1863024618690239)
(l 1869023918700265)
(l 1861027118770269)
(l 2078027620890246)
(l 2089024621050266)
(l 2105026621140245)
(l 2114024521340270)
(l 2143024221680243)
(l 2158024221550273)
(l 2179024521900246)
(l 2190024621810259)
(l 2181025921950262)

    (el 1416 913 172 310 0 6.28318)
  (el 1261 925 172 310 1.5707 2.93)
  (el 2489 826 92 223 0 6.28318)
  (el 2346 831 89 223 1.5707 2.85)
  (el 263 821 234 348 0.505 3.2)
  (el 263 821 99 147 1 2.3)

    ;(l 1416060412630612)
;(l 1416122512611235)
;(l 2489060324110607)
;(l 2489104923461052)

  (penup)
    (color "black")
  (setposition (+ x_o (* x_f (+ 1000 (* 20 (cos 0))))) (+ y_o (* y_f (+ 135 (* 40 (sin 0))))))
  (begin_fill)
  (el 1000 135 20 40 0 6.28318)
  (end_fill)

  (color "black")
  (setposition (+ x_o (* x_f (+ 1225 (* 20 (cos 0))))) (+ y_o (* y_f (+ 135 (* 40 (sin 0))))))
  (begin_fill)
  (el 1225 135 20 40 0 6.28318)
  (end_fill)



  (el 406 1096 432 532 4.165 5.259)

  (penup)
  (setposition 10000 10000)


  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)