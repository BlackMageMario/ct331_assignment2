#lang racket
(define (binary_tree_leaf value )
  (list '() value '() )
)

(define (binary_tree_node left_node value right_node)
  (list left_node value right_node))
;one more lab to go
(define (traverse tree)
  (cond
    [(empty? tree)]
    [else
     (begin
         (traverse (car tree))
         (printf" ~a "(cadr tree))
         (traverse (caddr tree))
      )
    ]    
  )
)

(define test_tree
  (binary_tree_node
   (binary_tree_node
    (binary_tree_leaf 1)
    3
    (binary_tree_leaf 6)
    )
   8
   (binary_tree_node
    (binary_tree_leaf 9)
    10
    (binary_tree_leaf 11)
    )
   )
  )
(define (search_tree tree value)
  (cond
    [(empty? tree) #f]
    [(= value (cadr tree))]
    [else(search_tree (car tree ) value)(search_tree (caddr tree) value)]
    )
  )
(define (insert_tree tree value)
  (display tree)
  (display "\n")
  (cond
    [(empty? tree)(binary_tree_leaf value)]
    [(= (cadr tree) value) #t]
    [(> (cadr tree) value)(list (insert_tree (car tree) value) (cadr tree) (caddr tree))]
    [(< (cadr tree) value)(list (car tree) (cadr tree) (insert_tree (caddr tree) value) )]        
  )
)
(define (insert_list_tree tree list)
  (cond
    [(empty? list) tree]
    [else (insert_list_tree (insert_tree tree (car list)) (cdr list))]
   )
)
;
(define (ascending_sort tree lowest_value)
  (cond
    [(empty? tree) lowest_value]
    [(< (cadr tree) lowest_value)(list (ascending_sort (car tree) (cadr tree))(ascending_sort (caddr tree) lowest_value))]
    [(> (cadr tree) lowest_value)(list (ascending_sort (car tree) lowest_value)(ascending_sort (caddr tree) (cadr tree)))]
  )
)
(define (descending_sort tree highest_value)
  (cond
    [(empty? tree) highest_value]
    [(< (cadr tree) highest_value)(list (descending_sort (car tree) highest_value)(descending_sort (caddr tree) (cadr tree)))]
    [(> (cadr tree) highest_value)(list (descending_sort (car tree) (cadr tree))(descending_sort (caddr tree) highest_value))]
   )
 )
(define test_list
  (list 14 28 7))