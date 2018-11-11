#lang scheme

; Simon Woldemichael
; CS 3361 Concepts of Programming Languages
; Programming Assignment on Scheme
; IDE: https://plt-scheme.org/ (win32)
; References:
;  1. https://stackoverflow.com/questions/7170162/converting-a-string-to-a-procedure
;  2. https://stackoverflow.com/questions/20778926/mysterious-racket-error-define-unbound-identifier-also-no-app-syntax-trans
; Examples:
;  Input: (lambda (X) (< X 5)) & (3 9 5 8 2 4 7)
;  Output: (3 2 4)
;  Input: (lambda (X) (> X 5)) & (3 9 5 8 2 4 7)
;  Output: (9 8 7)

; Part 2 - Return a list of all elements of a given list that satisfy a given boolean function.

; Request and read input procedure
(display "Please input a valid Boolean expression i.e. (lambda (X) (< X 5)): ")
(define bool_expr (read-line))

; Request and read input list
(display "Please input a numerical list. i.e. (3 9 5 8 2 4 7): ")
(define input_list (read))

; Need to define a namespace anchor for eval call
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

; Helper which takes an anonymous procedure as a string and evaluates it on args
(define (call-string text-lambda . args)
  (define (read-string text)
  (read
    (open-input-string text)))
  (apply
    (eval (read-string text-lambda) ns)
    args))

; Procedure for filtering input list based on expression
(define (bool_filter expression lst)
    (cond ((null? lst) '())
      ((call-string expression (car lst)) (cons (car lst) (bool_filter expression (cdr lst))))
    (else (bool_filter expression (cdr lst)))))

; Call procedure on input data and display result
(display (bool_filter bool_expr input_list))

