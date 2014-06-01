###
Kevin C. Baird
SICP in CoffeeScript:
 Exercise 2.33 - fill in sequence manipulations

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my-length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))
###

car  = (l) ->
  [head, tail...] = l
  head

cdr  = (l) ->
  [head, tail...] = l
  tail

cons = (x, y) -> [x].concat(y)

accumulate = (op, initial, sequence) ->
  if sequence.length is 0 then initial else
    op(car(sequence), accumulate(op, initial, cdr(sequence)))

myMap = (p, sequence) ->
  op = (x, y) -> cons(p(x), y)
  accumulate(op, [], sequence)

myAppend = (seq1, seq2) ->
  accumulate(cons, seq2, seq1)

myLength = (sequence) ->
  count = (x, y) -> y + 1
  accumulate(count, 0, sequence)

l1 = [0, 1, 2]
l2 = [3, 4, 5, 6]

double = (x) -> x * 2
console.log myMap(double, l1)
console.log myAppend(l1, l2)
console.log myLength(l1)
