;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (final-cs135-grade part refl midterm final assign)
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
(final-cs135-grade 100 100 100 50.5 100)
 

;Assignments 30 30
;Midterm exam 1 20 10
;Final exam 40 20
;Class participation 5 5
;Reflective Responses 5 5