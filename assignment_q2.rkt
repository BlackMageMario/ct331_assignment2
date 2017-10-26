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
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)
(define (ins_beg el lst)
  (cons el (cons lst empty)))

(define (ins_end el lst)
  (cons lst (cons el empty)))

(define (cout_top_level lst)
  (if(null? lst)
     0
     (+ 1 (cout_top_level(cdr lst)))))
;no need for nested cond
(define (count_instances lst item)
  (cond
    [(empty? lst) 0]
    [(equal? item (car lst))
        (+ 1 (count_instances (cdr lst) item))]
    [else (count_instances (cdr lst) item)]
  )
 )

(define (count_instances_tr_helper lst item)
  (count_instances_tr lst item 0)
  )
;tail recursive: we just call the function and add 1 to our out value
;if an item was found
(define (count_instances_tr lst item out)
  (cond
    [(empty? lst) out]
    [(equal? item (car lst))
     (count_instances_tr (cdr lst) item (+ 1 out))]
    [else (count_instances_tr (cdr lst) item out)]
    )
  )
(define (count_instances_deep_helper lst item)
  (count_instances_deep lst item 0)
  )
;similiar to the above
;except we have a new condition: if we find that
;the (car lst) is a list element itself, we count the instances in that
;and add it to the count instances of (cdr lst)
(define (count_instances_deep lst item out)
  (cond
    [(empty? lst) out]
    [(equal? item (car lst))
             (count_instances_deep (cdr lst) item (+ 1 out))]
    [(list? (car lst))
     (+ (count_instances_deep (car lst) item 0) (count_instances_deep (cdr lst) item out))]
    [else (count_instances_deep (cdr lst) item out)]
    )
  )
