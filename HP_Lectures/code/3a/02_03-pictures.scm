;; 02_03-pictures.scm
;;

;;; LECTURE PART 2

; assume I have a make-rect constructor and
; [horiz, vert, origin] selectors
; where 
;   origin is the lower left vertex, 
;   horiz is the horizontal distance to the next vertex, and
;   vert is the vertical distance to the next vertex

; coord-map on a given rect returns a procedure that takes a point
(define (coord-map rect)
  (lambda (point)
    (+vect
      (+vect (scale (xcor point)
                    (horiz rect))
             (scale (ycor point)
                    (vert rect)))
      (origin rect))))

; make-picture returns a procedure that draws a picture 
; to be scaled across a given rectangle
(define (make-picture seglist)
  (lambda (rect)
          (for-each 
            (lambda (s)
              (drawline
                ((coord-map rect) (seg-start s))
                ((coord-map rect) (seg-end s))))
            seglist)))

;; This would create the rect (the boundaries)
;(define r (make-rect ...))

;; This would create the picture procedure
;; to be drawn within some boundaries to be specific later
; (define g (make-picture ...))

;; This would draw the picture g within the boundaries r
; (g r)

;;; LECTURE PART 3

;; Now that we have primitives, we will implement other concepts
;;
;; such as beside
(define (beside-orig p1 p2 a)
  ;; KCB - rewrite this with internal define expressions
  (lambda (rect)
    (p1 (make-rect
          (origin rect)
          (scale a (horiz rect))
          (vert rect)))
    (p2 (make-rect
          (+vect (origin rect)
                 (scale a (horiz rect)))
          (scale (- 1 a) (horiz rect))
          (vert rect)))))

; this should be equivalent to beside-orig
(define (beside p1 p2 a)
  (lambda (rect)
    ; define the rects for each picture procedure first
    (define p1-rect
      (make-rect
        (origin rect)
        (scale a (horiz rect))
        (vert rect)))
    (define p2-rect 
      (make-rect
        (+vect (origin rect)
               (scale a (horiz rect)))
        (scale (- 1 a) (horiz rect))
        (vert rect)))
    ; then apply them
    (p1 p1-rect)
    (p2 p2-rect)))

;; or rotate
(define (rotate90 pict)
  (lambda (rect)
    (pict (make-rect
            ; new origin is origin shifted to lower right corner
            (+vect (origin rect)
                   (horiz rect))
            ; new horiz amount is vert value
            (vert rect)
            ; new vert amount is horiz value in opposite direction
            (scale -1 (horiz rect))))))

(define (right-push-orig pict distance scale-factor)
  (if (= distance 0) 
    pict
    (beside pict (right-push pict
                             (- distance 1)
                             scale-factor)
            scale-factor)))

(define (push combo)
  (lambda (pict1 distance scale-factor)
    ; repeated would need to be defined, as well
    ((repeated
      (lambda (pict2) (combo pict1 pict2 scale-factor))
      distance)
    pict1)))

(define right-push (push beside))

