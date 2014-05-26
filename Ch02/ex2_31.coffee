###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.31 - abstract tree-map

(define (tree-map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

###

treeMap = (proc, tree) ->
  if tree is [] then [] else
    tm = (tree) ->
      if tree.length > 1 then treeMap(proc, tree) else proc(tree)
    tm(x) for x in tree

square     = (x) -> x * x
squareTree = (tree) -> treeMap(square, tree)
t1         = [1, [2, [3, 4], 5], [6, 7]]

console.log squareTree(t1)
