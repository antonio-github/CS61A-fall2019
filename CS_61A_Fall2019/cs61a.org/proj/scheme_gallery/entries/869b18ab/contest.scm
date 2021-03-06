; ;; Scheme Recursive Art Contest Entry
; ;;
; ;; Please do not include your name or personal info in this file.
; ;;
; ;; Title: I'm sorry, Jon.
; ;;
; ;; Description:
; ;;   <I just checked the fridge,
; ;;    and I see no lasagna.
; ;;    I'm so sorry, Jon.>

(define (draw)
  (speed 0)
  
    (bgcolor "#660000")

  (define (draw-body)
    (begin
         (color "black")
      (pu)
      (goto -117.0 47.0)
      (pd)
      (begin_fill)
      (goto -98.0 36.5)
      (goto -61.0 38.0)
      (goto -41.0 49.0)
      (goto -14.0 38.5)
      (goto 11.0 44.0)
      (goto 37.5 27.0)
      (goto 57.0 18.0)
      (goto 66.0 -8.0)
      (goto 113.0 -35.5)
      (goto 168.5 -28.5)
      (goto 195.5 31.0)
      (goto 178.5 74.0)
      (goto 164.0 87.0)
      (goto 155.5 115.0)
      (goto 140.0 117.5)
      (goto 127.0 163.0)
      (goto 56.5 214.0)
      (goto 3.0 214.5)
      (goto -64.0 195.0)
      (goto -115.0 149.5)
      (goto -139.0 97.0)
      (goto -117.0 47.0)
      (end_fill)
  ))

  (define (draw-bodyblock0)
    (begin
         (color "#ee5555")
      (pu)
      (goto 82.5 166.0)
      (pd)
      (begin_fill)
      (goto 97.5 174.0)
      (goto 120.5 153.5)
      (goto 124.0 130.5)
      (goto 109.0 85.0)
      (goto 92.0 73.5)
      (goto 77.0 88.0)
      (goto 73.0 113.5)
      (goto 82.5 166.0)
      (end_fill)
  ))

  (define (draw-bodyblock1)
    (begin
         (color "#ee5555")
      (pu)
      (goto 61.0 195.0)
      (pd)
      (begin_fill)
      (goto 68.5 185.0)
      (goto 66.5 120.0)
      (goto 57.0 103.0)
      (goto 40.5 105.0)
      (goto 26.0 125.5)
      (goto 22.0 194.5)
      (goto 33.5 204.0)
      (goto 61.0 195.0)
      (end_fill)
  ))

  (define (draw-bodyblock2)
    (begin
         (color "#ee5555")
      (pu)
      (goto -10.5 203.0)
      (pd)
      (begin_fill)
      (goto 0.5 196.0)
      (goto 10.0 138.0)
      (goto 7.5 124.5)
      (goto -14.5 118.5)
      (goto -23.5 125.5)
      (goto -39.5 178.5)
      (goto -32.0 200.5)
      (goto -10.5 203.0)
      (end_fill)
  ))

  (define (draw-bodyblock3)
    (begin
         (color "#ee5555")
      (pu)
      (goto -67.5 163.5)
      (pd)
      (begin_fill)
      (goto -55.0 166.0)
      (goto -47.0 159.5)
      (goto -32.5 127.5)
      (goto -36.5 110.5)
      (goto -55.0 97.0)
      (goto -65.5 108.0)
      (goto -72.5 154.0)
      (goto -67.5 163.5)
      (end_fill)
  ))

  (define (draw-bodyblock4)
    (begin
         (color "#ee5555")
      (pu)
      (goto -97.5 122.0)
      (pd)
      (begin_fill)
      (goto -86.5 122.0)
      (goto -69.5 91.5)
      (goto -71.5 81.5)
      (goto -81.0 74.5)
      (goto -90.0 81.5)
      (goto -103.5 108.0)
      (goto -103.0 118.5)
      (goto -97.5 122.0)
      (end_fill)
  ))

  (define (draw-leg0)
    (begin
         (color "black")
      (pu)
      (goto -102.5 40.5)
      (pd)
      (begin_fill)
      (goto -100.0 63.0)
      (goto -80.0 70.5)
      (goto -62.0 42.5)
      (goto -66.0 16.0)
      (goto -51.5 -21.5)
      (goto -56.0 -43.5)
      (goto -71.0 -66.0)
      (goto -100.0 -147.5)
      (goto -104.0 -184.0)
      (goto -93.5 -199.0)
      (goto -105.0 -203.5)
      (goto -115.5 -196.5)
      (goto -108.0 -182.0)
      (goto -104.0 -136.5)
      (goto -82.5 -65.0)
      (goto -68.0 -35.5)
      (goto -102.5 40.5)
      (end_fill)
  ))

  (define (draw-leg1)
    (begin
         (color "black")
      (pu)
      (goto -40.0 48.5)
      (pd)
      (begin_fill)
      (goto -41.5 68.5)
      (goto -18.0 68.0)
      (goto -13.5 39.0)
      (goto 2.0 -12.0)
      (goto 1.0 -34.5)
      (goto -11.5 -71.5)
      (goto -28.5 -134.5)
      (goto -25.0 -178.5)
      (goto -11.5 -188.5)
      (goto -26.5 -192.5)
      (goto -33.0 -185.5)
      (goto -36.5 -158.0)
      (goto -21.0 -66.0)
      (goto -11.0 -37.5)
      (goto -40.0 48.5)
      (end_fill)
  ))

  (define (draw-leg2)
    (begin
         (color "black")
      (pu)
      (goto 10.5 47.0)
      (pd)
      (begin_fill)
      (goto 8.0 76.0)
      (goto 25.5 101.0)
      (goto 52.5 95.5)
      (goto 59.5 71.5)
      (goto 35.5 26.5)
      (goto 28.0 -1.5)
      (goto 22.0 -52.5)
      (goto 16.0 -73.0)
      (goto 22.0 -138.0)
      (goto 30.5 -176.5)
      (goto 64.0 -197.5)
      (goto 32.5 -206.5)
      (goto 23.0 -183.5)
      (goto 18.5 -138.0)
      (goto 11.0 -70.0)
      (goto 14.0 -36.5)
      (goto 16.0 20.0)
      (goto 10.5 47.0)
      (end_fill)
  ))

  (define (draw-leg3)
    (begin
         (color "black")
      (pu)
      (goto 76.0 -11.0)
      (pd)
      (begin_fill)
      (goto 81.0 1.0)
      (goto 95.5 -7.0)
      (goto 86.0 -23.5)
      (goto 80.5 -65.0)
      (goto 78.0 -116.5)
      (goto 90.0 -173.0)
      (goto 103.0 -179.0)
      (goto 124.0 -182.0)
      (goto 92.5 -190.5)
      (goto 84.0 -176.5)
      (goto 70.5 -117.0)
      (goto 63.5 -83.5)
      (goto 76.0 -11.0)
      (end_fill)
  ))

  (define (draw-legpart0)
    (begin
         (color "#ee5555")
      (pu)
      (goto -88.0 42.5)
      (pd)
      (begin_fill)
      (goto -69.5 7.0)
      (goto -85.5 46.0)
      (goto -88.0 42.5)
      (end_fill)
  ))

  (define (draw-legpart1)
    (begin
         (color "#ee5555")
      (pu)
      (goto -21.5 38.5)
      (pd)
      (begin_fill)
      (goto -2.5 -22.0)
      (goto 0.5 -21.5)
      (goto -17.0 38.5)
      (goto -21.5 38.5)
      (goto -21.5 38.5)
      (end_fill)
  ))

  (define (draw-legpart2)
    (begin
         (color "#ee5555")
      (pu)
      (goto 25.5 52.0)
      (pd)
      (begin_fill)
      (goto 34.0 61.0)
      (goto 33.5 50.0)
      (goto 29.5 35.0)
      (goto 19.5 -26.0)
      (goto 25.0 34.5)
      (goto 25.5 52.0)
      (end_fill)
  ))

  (define (draw-legpart3)
    (begin
         (color "#ee5555")
      (pu)
      (goto 81.0 -22.0)
      (pd)
      (begin_fill)
      (goto 75.0 -66.0)
      (goto 83.5 -25.0)
      (goto 81.0 -22.0)
      (end_fill)
  ))

  (define (draw-eyeu0)
    (begin
         (color "#ee5555")
      (pu)
      (goto 172.0 41.5)
      (pd)
      (begin_fill)
      (goto 185.0 43.5)
      (goto 195.0 34.5)
      (goto 194.0 24.5)
      (goto 177.0 -3.0)
      (goto 161.0 9.5)
      (goto 172.0 41.5)
      (end_fill)
  ))

  (define (draw-eyed0)
    (begin
         (color "#ee5555")
      (pu)
      (goto 161.0 7.0)
      (pd)
      (begin_fill)
      (goto 176.0 -4.0)
      (goto 169.5 -10.0)
      (goto 160.0 -8.0)
      (goto 155.5 -2.0)
      (goto 161.0 7.0)
      (end_fill)
  ))

  (define (draw-eyeu1)
    (begin
         (color "#ee5555")
      (pu)
      (goto 125.5 31.5)
      (pd)
      (begin_fill)
      (goto 140.5 57.5)
      (goto 154.5 61.0)
      (goto 161.5 53.5)
      (goto 160.5 42.5)
      (goto 144.5 16.5)
      (goto 125.5 31.5)
      (end_fill)
  ))

  (define (draw-eyed1)
    (begin
         (color "#ee5555")
      (pu)
      (goto 125.0 30.0)
      (pd)
      (begin_fill)
      (goto 143.5 15.0)
      (goto 137.5 11.5)
      (goto 125.5 14.0)
      (goto 121.0 22.0)
      (goto 125.0 30.0)
      (end_fill)
  ))

  (define (draw-eyep1)
    (begin
         (color "black")
      (pu)
      (goto 131.5 20.5)
      (pd)
      (begin_fill)
      (goto 128.5 20.5)
      (goto 130.0 18.0)
      (goto 132.5 18.0)
      (goto 131.5 20.5)
      (end_fill)
  ))

  (define (draw-eyep0)
    (begin
         (color "black")
      (pu)
      (goto 163.5 -2.0)
      (pd)
      (begin_fill)
      (goto 165.5 -2.0)
      (goto 166.0 -3.5)
      (goto 164.0 -3.5)
      (goto 163.5 -2.0)
      (end_fill)
  ))

  (define (draw-ear0)
    (begin
         (color "black")
      (pu)
      (goto 139.5 80.0)
      (pd)
      (begin_fill)
      (goto 166.5 98.0)
      (goto 181.5 90.5)
      (goto 169.0 64.5)
      (goto 139.5 80.0)
      (end_fill)
  ))

  (define (draw-ear1)
    (begin
         (color "black")
      (pu)
      (goto 179.5 65.0)
      (pd)
      (begin_fill)
      (goto 191.0 72.5)
      (goto 214.0 72.0)
      (goto 209.0 61.0)
      (goto 192.5 33.5)
      (goto 179.5 65.0)
      (end_fill)
  ))

  (define (draw-earhl0)
    (begin
         (color "#ee5555")
      (pu)
      (goto 145.5 74.5)
      (pd)
      (begin_fill)
      (goto 173.0 90.5)
      (goto 175.0 88.0)
      (goto 169.0 67.0)
      (goto 177.5 85.0)
      (goto 172.0 94.5)
      (goto 164.5 95.0)
      (goto 141.5 78.5)
      (goto 145.5 74.5)
      (end_fill)
  ))

  (define (draw-earhl1)
    (begin
         (color "#ee5555")
      (pu)
      (goto 187.0 55.5)
      (pd)
      (begin_fill)
      (goto 206.0 71.0)
      (goto 187.5 69.5)
      (goto 182.0 65.5)
      (goto 187.0 55.5)
      (end_fill)
  ))

  (define (draw-moustache0)
    (begin
         (color "#ee5555")
      (pu)
      (goto 115.0 30.5)
      (pd)
      (begin_fill)
      (goto 122.0 14.0)
      (goto 132.5 2.5)
      (goto 131.0 -6.0)
      (goto 115.0 -7.5)
      (goto 102.5 3.5)
      (goto 99.5 19.0)
      (goto 107.0 29.0)
      (goto 114.0 32.5)
      (goto 115.0 30.5)
      (end_fill)
  ))

  (define (draw-moustache1)
    (begin
         (color "#ee5555")
      (pu)
      (goto 152.0 -14.0)
      (pd)
      (begin_fill)
      (goto 158.0 -25.0)
      (goto 166.0 -28.0)
      (goto 176.5 -20.0)
      (goto 182.5 -10.5)
      (goto 181.0 -5.5)
      (goto 167.5 -13.5)
      (goto 155.0 -9.5)
      (goto 152.0 -14.0)
      (end_fill)
  ))

  (define (draw-teeth0)
    (begin
         (color "#ee5555")
      (pu)
      (goto 121.5 -11.5)
      (pd)
      (begin_fill)
      (goto 123.0 -15.0)
      (goto 125.5 -12.0)
      (goto 121.5 -11.5)
      (end_fill)
  ))

  (define (draw-teeth1)
    (begin
         (color "#ee5555")
      (pu)
      (goto 124.0 -15.5)
      (pd)
      (begin_fill)
      (goto 125.5 -18.0)
      (goto 130.0 -13.0)
      (goto 127.5 -12.0)
      (goto 124.0 -15.5)
      (end_fill)
  ))

  (define (draw-teeth2)
    (begin
         (color "#ee5555")
      (pu)
      (goto 128.0 -18.5)
      (pd)
      (begin_fill)
      (goto 129.5 -20.0)
      (goto 134.0 -14.5)
      (goto 132.0 -13.5)
      (goto 128.0 -18.5)
      (end_fill)
  ))

  (define (draw-teeth3)
    (begin
         (color "#ee5555")
      (pu)
      (goto 131.5 -21.5)
      (pd)
      (begin_fill)
      (goto 133.5 -23.0)
      (goto 138.5 -15.5)
      (goto 134.5 -16.0)
      (goto 131.5 -21.5)
      (end_fill)
  ))

  (define (draw-teeth4)
    (begin
         (color "#ee5555")
      (pu)
      (goto 136.0 -24.0)
      (pd)
      (begin_fill)
      (goto 138.0 -24.5)
      (goto 142.0 -18.0)
      (goto 138.5 -18.5)
      (goto 136.0 -24.0)
      (end_fill)
  ))

  (define (draw-teeth5)
    (begin
         (color "#ee5555")
      (pu)
      (goto 143.0 -20.0)
      (pd)
      (begin_fill)
      (goto 140.0 -24.5)
      (goto 144.0 -23.0)
      (goto 146.0 -19.5)
      (goto 143.0 -20.0)
      (end_fill)
  ))

  (define (draw-teeth6)
    (begin
         (color "#ee5555")
      (pu)
      (goto 147.0 -20.5)
      (pd)
      (begin_fill)
      (goto 146.5 -22.0)
      (goto 148.5 -22.0)
      (goto 150.5 -19.5)
      (goto 147.0 -20.5)
      (end_fill)
  ))

  (define (draw-nose)
    (begin
         (color "#ee5555")
      (pu)
      (goto 134.0 -2.5)
      (pd)
      (begin_fill)
      (goto 152.5 12.5)
      (goto 150.0 -14.0)
      (goto 149.0 -14.5)
      (goto 150.0 2.5)
      (goto 146.0 5.0)
      (goto 134.5 -3.0)
      (goto 134.0 -2.5)
      (end_fill)
  ))

  (define (draw-tongue)
    (begin
         (color "black")
      (pu)
      (goto 115.0 -31.0)
      (pd)
      (begin_fill)
      (goto 129.5 -24.5)
      (goto 144.0 -29.5)
      (goto 139.5 -38.0)
      (goto 140.0 -42.5)
      (goto 148.5 -48.0)
      (goto 148.5 -50.5)
      (goto 151.0 -52.0)
      (goto 168.5 -51.5)
      (goto 178.5 -55.5)
      (goto 185.5 -64.0)
      (goto 186.0 -74.5)
      (goto 180.5 -86.5)
      (goto 173.5 -93.0)
      (goto 164.0 -94.0)
      (goto 155.0 -88.5)
      (goto 149.0 -82.0)
      (goto 138.5 -81.5)
      (goto 139.0 -91.5)
      (goto 135.5 -92.5)
      (goto 130.5 -90.0)
      (goto 129.0 -82.0)
      (goto 137.5 -76.5)
      (goto 148.5 -78.5)
      (goto 163.0 -90.0)
      (goto 171.5 -90.0)
      (goto 176.5 -84.5)
      (goto 181.0 -74.5)
      (goto 177.0 -64.0)
      (goto 168.0 -59.5)
      (goto 149.5 -59.5)
      (goto 141.5 -60.0)
      (goto 131.5 -55.5)
      (goto 120.0 -45.5)
      (goto 115.0 -31.0)
      (end_fill)
  ))

  (define (draw-tail)
    (begin
         (color "black")
      (pu)
      (goto -130.5 85.0)
      (pd)
      (begin_fill)
      (goto -148.0 70.0)
      (goto -152.0 58.0)
      (goto -144.5 15.5)
      (goto -150.5 -6.0)
      (goto -158.0 -7.5)
      (goto -171.5 2.0)
      (goto -172.5 16.0)
      (goto -179.0 26.0)
      (goto -190.5 33.5)
      (goto -205.0 33.5)
      (goto -212.0 23.0)
      (goto -210.5 0.5)
      (goto -207.0 -9.5)
      (goto -196.5 -19.5)
      (goto -186.5 -30.0)
      (goto -166.5 -34.0)
      (goto -153.0 -38.5)
      (goto -142.0 -31.5)
      (goto -131.5 -27.5)
      (goto -125.5 -12.5)
      (goto -119.0 0.0)
      (goto -115.0 14.0)
      (goto -119.5 25.5)
      (goto -120.5 43.5)
      (goto -110.5 56.5)
      (goto -115.5 77.5)
      (goto -130.5 85.0)
      (end_fill)
  ))

  (define (draw-tailblock1)
    (begin
         (color "#ee5555")
      (pu)
      (goto -144.0 68.0)
      (pd)
      (begin_fill)
      (goto -142.0 72.0)
      (goto -135.0 72.0)
      (goto -134.0 66.5)
      (goto -137.5 58.0)
      (goto -134.5 47.0)
      (goto -144.0 50.0)
      (goto -146.0 56.5)
      (goto -141.0 62.5)
      (goto -144.0 68.0)
      (end_fill)
  ))

  (define (draw-tailblock2)
    (begin
         (color "#ee5555")
      (pu)
      (goto -142.5 47.0)
      (pd)
      (begin_fill)
      (goto -133.0 34.0)
      (goto -134.5 22.0)
      (goto -143.0 31.5)
      (goto -145.5 43.0)
      (goto -142.5 47.0)
      (end_fill)
  ))

  (define (draw-tailblock3)
    (begin
         (color "#ee5555")
      (pu)
      (goto -141.0 17.5)
      (pd)
      (begin_fill)
      (goto -135.0 12.5)
      (goto -136.0 5.5)
      (goto -139.5 0.0)
      (goto -143.5 5.5)
      (goto -141.0 17.5)
      (end_fill)
  ))

  (define (draw-tailblock4)
    (begin
         (color "#ee5555")
      (pu)
      (goto -144.5 -4.5)
      (pd)
      (begin_fill)
      (goto -142.0 -7.5)
      (goto -145.5 -10.5)
      (goto -153.0 -15.0)
      (goto -168.5 -13.0)
      (goto -171.0 -11.0)
      (goto -170.5 -2.5)
      (goto -165.5 -5.0)
      (goto -164.0 -10.5)
      (goto -154.5 -13.0)
      (goto -149.0 -9.5)
      (goto -148.5 -7.0)
      (goto -144.5 -4.5)
      (end_fill)
  ))

  (define (draw-tailblock5)
    (begin
         (color "#ee5555")
      (pu)
      (goto -177.5 1.5)
      (pd)
      (begin_fill)
      (goto -182.5 -3.5)
      (goto -189.0 8.5)
      (goto -202.5 15.5)
      (goto -207.5 23.5)
      (goto -204.5 28.0)
      (goto -189.5 27.5)
      (goto -183.0 21.0)
      (goto -180.0 7.0)
      (goto -177.5 1.5)
      (end_fill)
  ))
  (draw-body)
  (draw-bodyblock0)
  (draw-bodyblock1)
  (draw-bodyblock2)
  (draw-bodyblock3)
  (draw-bodyblock4)
  (draw-leg0)
  (draw-leg1)
  (draw-leg2)
  (draw-leg3)
  (draw-legpart0)
  (draw-legpart1)
  (draw-legpart2)
  (draw-legpart3)
  (draw-eyeu0)
  (draw-eyed0)
  (draw-eyeu1)
  (draw-eyed1)
  (draw-eyep1)
  (draw-eyep0)
  (draw-ear0)
  (draw-ear1)
  (draw-earhl0)
  (draw-earhl1)
  (draw-moustache0)
  (draw-moustache1)
  (draw-teeth0)
  (draw-teeth1)
  (draw-teeth2)
  (draw-teeth3)
  (draw-teeth4)
  (draw-teeth5)
  (draw-teeth6)
  (draw-nose)
  (draw-tongue)
  (draw-tail)
  (draw-tailblock1)
  (draw-tailblock2)
  (draw-tailblock3)
  (draw-tailblock4)
  (draw-tailblock5)
  (ht)

  (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
