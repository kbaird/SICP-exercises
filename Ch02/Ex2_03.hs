{-
 - Ex2_02.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Represent rectangles on a plane
 -
 -}

module Ex2_03 where
import Ex2_02

newtype Rectangle = MakeRectangle (Point, Point, Point, Point)

toRectangle :: (Point, Point, Point, Point) -> Rectangle
toRectangle (p1,p2,p3,p4) = MakeRectangle (p1,p2,p3,p4)

fromRectangle :: Rectangle -> (Point, Point, Point, Point)
fromRectangle (MakeRectangle (p1,p2,p3,p4)) = (p1,p2,p3,p4)

upperLeft :: Rectangle -> Point
upperLeft s = ul
  where (ul, _, _, _) = fromRectangle s

upperRight :: Rectangle -> Point
upperRight s = ur
  where (_, ur, _, _) = fromRectangle s

lowerLeft :: Rectangle -> Point
lowerLeft s = ll
  where (_, _, ll, _) = fromRectangle s

lowerRight :: Rectangle -> Point
lowerRight s = lr
  where (_, _, _, lr) = fromRectangle s

perimeter :: Rectangle -> Float
perimeter s = (top + side) * 2
  where top             = distance ul ur
        side            = distance ur lr
        distance p1 p2  = sqrt (square(xDiff p1 p2) + square(yDiff p1 p2))
        xDiff p1 p2     = (xPoint p2) - (xPoint p1)
        yDiff p1 p2     = (yPoint p2) - (yPoint p1)
        ul              = upperLeft s
        ur              = upperRight s
        lr              = lowerRight s
        square x       = x * x

area :: Rectangle -> Float
area s = top * side
  where top             = distance ul ur
        side            = distance ur lr
        distance p1 p2  = sqrt (square(xDiff p1 p2) + square(yDiff p1 p2))
        xDiff p1 p2     = (xPoint p2) - (xPoint p1)
        yDiff p1 p2     = (yPoint p2) - (yPoint p1)
        ul              = upperLeft s
        ur              = upperRight s
        lr              = lowerRight s
        square x       = x * x
