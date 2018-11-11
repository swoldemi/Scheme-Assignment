#lang scheme
; Simon Woldemichael
; CS 3361 Concepts of Programming Languages
; Project 2
; References:
;  1. https://en.wikibooks.org/wiki/Scheme_Programming/List_Operations


; Part 1 - Return all rotations of a given list

; Procedure to append elements to a list
(define (append . lsts)
  (cond
    ((null? lsts) '())
    ((null? (car lsts)) (apply append (cdr lsts)))
    (else (cons (caar lsts) (apply append (cdar lsts) (cdr lsts))))))

; Procedure to loop and read each number
(define (read_nums min max)
  (when (>= max min)
    (display "Please input the next number: ")
    (append input_list (list (read)))
    (display input_list)
    (read_nums (+ min 1) max)))

; Request and read input list
(display "Please input a list. i.e. (a b c d): ")
(define input_list (read))
(display input_list)

; Procedure to return all rotations of the list
(define (rotate LIST)
  (if (null? LIST)
    '()
    (append (cdr LIST)
            (cons (car LIST)
                  '()))))

; Call and display the procedure
(display (rotate input_list))