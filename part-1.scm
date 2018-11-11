#lang scheme

; Simon Woldemichael
; CS 3361 Concepts of Programming Languages
; Programming Assignment on Scheme
; IDE: https://plt-scheme.org/
; References:
;  1. https://en.wikibooks.org/wiki/Scheme_Programming/List_Operations

; Part 1 - Return all rotations of a given list

; Request and read input list
(display "Please input a list. i.e. (a b c d): ")
(define input_list (read))

; Procedure to display all rotations of the list
; A list with n elements has n unique rotations
(define (rotate lst n)
  (cond ((> n 0) 
    (begin
      (display lst)
      (rotate (append (cdr lst) (cons (car lst)'())) (- n 1))))))

; Call the procedure
(rotate input_list (length input_list))
