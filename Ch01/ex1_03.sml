(*
Kevin C. Baird
SICP in Standard ML:
  Write a function that takes 3 arguments and returns
  the sum of the squares of the 2 largest arguments.
*)

fun sum_squares_2_largest(a, b, c) =
    let fun sum_squares(a, b) = a*a + b*b
    in
        if a <= b andalso a <= c then sum_squares(b, c) else
        if b <= a andalso b <= c then sum_squares(a, c) else
        sum_squares(a, b)
    end

