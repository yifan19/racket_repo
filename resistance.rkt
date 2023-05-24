;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname resistance) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; (compute-resistance c1 c2 c3)
;; produce the resistance value from 3 color bands

;; Examples:
(check-expect (compute-resistance 'yellow 'violet 'red)  4700)
(check-expect (compute-resistance 'red 'black 'brown) 200)

;; compute-resistance: String String String -> Num
(define (compute-resistance c1 c2 c3)

    (*  (expt 10 (get-val c3))
        (+
            (* 10 (get-val c1))
            (get-val c2)
        )
    )

)
(check-expect (compute-resistance 'black 'black 'black) 0)
(check-expect (compute-resistance 'brown 'black 'red) 1000)
(check-expect (compute-resistance 'white 'white 'white) 99000000000)

;; (get-val color)
;; computes the number for the color band on the resistor

;; Examples:
(check-expect (get-val 'black) 0)
(check-expect (get-val 'brown) 1)

(define (get-val color)
    (cond [(symbol=? color 'black  ) 0]
          [(symbol=? color 'brown  ) 1]
          [(symbol=? color 'red    ) 2]
          [(symbol=? color 'orange ) 3]
          [(symbol=? color 'yellow ) 4]
          [(symbol=? color 'green  ) 5]
          [(symbol=? color 'blue   ) 6]
          [(symbol=? color 'violet ) 7]
          [(symbol=? color 'grey   ) 8]
          [(symbol=? color 'white  ) 9]
    )
)

