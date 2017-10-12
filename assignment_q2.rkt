#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(define (ins_beg el lst)
  (cons el (cons lst empty)))

(define (ins_end el lst)
  (cons lst (cons el empty)))

(define (cout_top_level lst)
  (if(null? lst)
     0
     (+ 1 (cout_top_level(cdr lst)))))