;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bonus) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (final-cs135-grade part refl midterm final assign)
; min(GRADE, 46)
    (min 
        (compute-grade part refl midterm final assign)
        ; 100 or 46
        (fail-assignment assign)
        (fail-exam midterm final)
    )

)

(define (compute-grade part refl midterm final assign)
    (/
        (+ (* 5 part)
            (* 5 refl)
            (* 20 midterm)
            (* 40 final)
            (* 30 assign)
        )
        100 
    )
)
; (max(min(grade-percent, 49) 50) - 49) * 54 + 46
; if student failed return 46, if student passed return their grade 100
(define (is-assessment-fail grade-percent)
   ( +
        ( *
            (-
            (max 
                (min 
                    (floor grade-percent)
                    50
                )
                49
            )
            49
            )
            54
        )
        46
    )
)

(define (fail-assignment assign)
    (is-assessment-fail assign)
    
)

; m * 0.2 + f * 0.4 <= 30
; 2m + 4f <= 300
(define (fail-exam midterm final)
    (is-assessment-fail
        (/
            (+
            (* 20 midterm)
            (* 40 final)
            )
            60
        )
    )
)

(check-expect (final-cs135-grade 0 0 0 0 0) 0)
(check-expect (final-cs135-grade 100 100 100 100 100) 100)
(check-expect (final-cs135-grade 50 50 50 50 50) 50)
(check-expect (final-cs135-grade 50 50 50 50 49) 46)
(check-expect (final-cs135-grade 50 50 50 49 50) 46)
(check-expect (final-cs135-grade 50 49 50 50 50) 49.95)
(check-expect (final-cs135-grade 0  0 49 49 48) 43.8)

(check-expect (fail-assignment 50) 100)
(check-expect (fail-assignment 49) 46)
(check-expect (fail-assignment 100) 100)
(check-expect (fail-assignment 49.999) 46)
(check-expect (fail-exam 90 90) 100)
(check-expect (fail-exam 49 49) 46)
(check-expect (fail-exam 30 (/ 240 4 )) 100)
(check-expect (fail-exam 30 (/ 239.99 4 )) 46)

; (fail-exam 0 100)
;Assignments 30 30
;Midterm exam 1 20 
;Final exam 40 20
;Class participation 5 5
;Reflective Responses 5 5