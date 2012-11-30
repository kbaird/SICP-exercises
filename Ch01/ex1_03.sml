(*
Kevin C. Baird
SICP in Standard ML:
  Write a function that takes 3 arguments and returns
  the sum of the squares of the 2 largest arguments.
*)

fun sum_squares_2_largest(a, b, c) =
    let fun sum_squares([a, b]) = a*a + b*b
          | sum_squares(_)      = 0;
        val min      = Int.min(a, Int.min(b, c));
        val not_min  = fn x=>x <> min;
        val largest2 = List.filter not_min [a,b,c]
    in
        sum_squares(largest2)
    end

