#lang scheme

; Simon Woldemichael
; CS 3361 Concepts of Programming Languages
; Programming Assignment on Scheme
; IDE: https://plt-scheme.org/ (win32)
; References:
;  1. https://en.wikibooks.org/wiki/Scheme_Programming/List_Operations
;  2. https://stackoverflow.com/questions/2747562/car-and-cdr-in-scheme-are-driving-me-crazy

; Part 1 - Return all rotations of a given list

; Request and read input list
(display "Please input a list. i.e. (a b c d): ")
(define input_list (read))

; Procedure to display all rotations of the list
; A list with n elements has n unique singular rotations/shifts
(define (rotate lst n)
  (cond ((> n 0) ; While there are more rotations to be done
    (begin
      (display lst) ; Display the current rotation
         #| Move the first element of the list to the end and
         Decrement n and before making another recursive call to
         yield the next rotation. |#
      (rotate (append (cdr lst) (cons (car lst)'())) (- n 1))))))

; Call the procedure
(rotate input_list (length input_list))
