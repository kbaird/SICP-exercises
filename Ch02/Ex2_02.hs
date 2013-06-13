{-
 - Ex2_02.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Represent line segments on a plane
 -
 -}

module Ex2_2 where

newtype Point = MakePoint (Float, Float)

toPoint :: (Float, Float) -> Point
toPoint (x, y) = MakePoint (x, y)

fromPoint :: Point -> (Float, Float)
fromPoint (MakePoint (x, y)) = (x, y)

xPoint :: Point -> Float
xPoint p = x
  where (x, _) = fromPoint p

yPoint :: Point -> Float
yPoint p = y
  where (_, y) = fromPoint p

newtype Segment = MakeSegment (Point, Point)

toSegment :: (Point, Point) -> Segment
toSegment (start, end) = MakeSegment (start, end)

fromSegment :: Segment -> (Point, Point)
fromSegment (MakeSegment (start, end)) = (start, end)

startSegment :: Segment -> Point
startSegment s = start
  where (start, _) = fromSegment s

endSegment :: Segment -> Point
endSegment s = end
  where (_, end)   = fromSegment s

