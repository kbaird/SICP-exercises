(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.12 - Output Pascal's Triangle via recursive process
*)

fun pascals_triangle(0) = []
  | pascals_triangle(1) = [1]
  | pascals_triangle(2) = [1, 1]
  | pascals_triangle(row_num) =
    let
        val previous_row = pascals_triangle(row_num - 1)
        fun summed_pairs_from_list([])           = []
          | summed_pairs_from_list([x])          = [x]
          | summed_pairs_from_list([x,y])        = [x+y]
          | summed_pairs_from_list((x::y::tail)) = [x+y] @ summed_pairs_from_list([y] @ tail)
        fun summed_pairs(row_num) =
            summed_pairs_from_list(previous_row)
    in  [1] @ summed_pairs(row_num) @ [1]
    end

