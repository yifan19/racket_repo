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

;; (date->day-of-week date)
;; produce the resistance value from 3 color bands

;; Examples:
(check-expect (date->day-of-week 38781202) 'Monday)
(check-expect (date->day-of-week 18321401) 'Invalid)
(check-expect (date->day-of-week 1920303) 'Invalid)

;; date->day-of-week: String String String -> Num
(define (date->day-of-week date)
    
    
    (remainder
        (+
            ;; day 
            (remainder date 100)
            (floor
                (- 
                    (* 2.6 
                        ;; month
                        (remainder (quotient date 100) 100)
                    )
                    0.2
                )
            )
            (* -2
                (remainder date 1000000)   
            )
            ;; year
            (remainder date 10000)
            (floor 
                ;; year
                (/ (remainder date 10000) 4)
            )
            (floor 
                ;; century
                (/ (remainder date 1000000) 4)
            )
        ) 7
    )
)

(date->day-of-week 38781203)
;; Tests:
(check-expect (date->day-of-week 38781203) 'Tuesday)
(check-expect (date->day-of-week 38781204) 'Wednesday)
(check-expect (date->day-of-week 38781205) 'Thusrday)
(check-expect (date->day-of-week 38781206) 'Friday)
(check-expect (date->day-of-week 38781207) 'Saturday)
(check-expect (date->day-of-week 38781208) 'Sunday)

(define (day date)

    (cond [(<= (remainder date 100)
)

(define (day month))



(define (translate week_num)

    (cond 
        [(= week_num 1)  'Monday]
        [(= week_num 2)  'Tuesday]
        [(= week_num 3)  'Wednesday]
        [(= week_num 4)  'Thusrday]
        [(= week_num 5)  'Friday]
        [(= week_num 6)  'Saturday]
        [(= week_num 0)  'Sunday]
        [else 'Invalid]
    )
)

(translate -1)

(define (get-year date)
    (remainder date 100)
)

(get-year 345)
