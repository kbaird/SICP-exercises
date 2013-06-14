(*
Kevin C. Baird
SICP in Standard ML:
  Write a function that takes 3 arguments and returns
  the sum of the squares of the 2 largest arguments.
*)

fun sumSquaresTwoLargest(a, b, c) =
    let fun sumSquares([a, b]) = a*a + b*b
          | sumSquares(_)      = 0
        val min      = Int.min(a, Int.min(b, c))
        val notMin   = fn x=>x <> min
        val largest2 = List.filter notMin [a,b,c]
    in  sumSquares(largest2)
    end

