(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.12 - Output Pascal's Triangle via recursive process
*)

fun pascalsTriangle(0) = []
  | pascalsTriangle(1) = [1]
  | pascalsTriangle(2) = [1, 1]
  | pascalsTriangle(rowNum) =
    let
        val previousRow = pascalsTriangle(rowNum - 1)
        fun pairsFromList([])           = []
          | pairsFromList([x])          = [x]
          | pairsFromList([x,y])        = [x+y]
          | pairsFromList((x::y::tail)) = [x+y] @ pairsFromList([y] @ tail)
        fun summedPairs(rowNum)         = pairsFromList(previousRow)
    in  [1] @ summedPairs(rowNum) @ [1]
    end

