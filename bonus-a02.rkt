;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bonus-a02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (get-month date)
    (remainder(quotient date 100) 100)
)
(define (get-day date)
    (remainder date 100)
)
(define (get-year date)
    (quotient date 10000)
)

(check-expect (get-year 19980619) 1998)
(check-expect (get-month 19980619) 6)
(check-expect (get-day 19980619) 19)

(define (check-month-valid? date)
    (and 
        (>= (get-month date) 1)
        (<= (get-month date) 12)
    )
)
;; (= 4 and !(=100)) or (=400)
(define (is-leap-year? date)
    (or
        (and 
            (= (remainder (get-year date) 4) 0)
            (not (= (remainder (get-year date) 100) 0))
        )
            
        (= (remainder (get-year date) 400) 0)
    )
)


;; 1 2 3 4 5 6 7 8 9 10 11 12
;; x s x   x   x x    x     x
(define (check-day-valid? date)
    (and 
        (<= (get-day date) 31)
        (cond
            [
                (or 
                    (= (get-month date) 1)
                    (= (get-month date) 3)
                    (= (get-month date) 5)
                    (= (get-month date) 7)
                    (= (get-month date) 8)
                    (= (get-month date) 10)
                    (= (get-month date) 12)
                ) 
                (<= (get-day date) 31)
            ]
            [
                (or 
                    (= (get-month date) 4)
                    (= (get-month date) 6)
                    (= (get-month date) 9)
                    (= (get-month date) 11)
                )
                (<= (get-day date) 30)
            ]
            [
                else 
                (
                    cond [(is-leap-year? date) (<= (get-day date) 29)]
                         [else (<= (get-day date) 28)]
                )
            ]

        )
    )
)
(check-month-valid? 19980019)
(check-month-valid? 19989919)
(check-day-valid? 999999)
(check-day-valid? 19980732)
(check-day-valid? 19980731)
(check-day-valid? 19980631)
(check-day-valid? 19980229)
(check-day-valid? 20000229)
(check-day-valid? 21000229)