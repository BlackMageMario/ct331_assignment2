#lang racket
(define conspair(cons 1 2))
(define conslist(cons 1 (cons 2 (cons 3 empty))))
;to create a proper list we need to cons empty onto the final result
(define strNumNestedListWithCons(cons 'string (cons 4 (cons (cons 1 (cons 2 (cons 3 empty))) empty))))
;requires quite a few cons to avoid using list notation if I have it done correctly
(define strNumNestedList (list 'string 4 (list 1 2 3)))
(define strNumNestedListWithAppend(append '(string) '(4) '((1 2 3))))
