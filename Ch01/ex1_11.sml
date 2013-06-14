(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.11 - define both recursive and iterative processes
*)

fun f_rec(n) =
    if n < 3 then n
             else f_rec(n - 1) +
                 (f_rec(n - 2) * 2) +
                 (f_rec(n - 3) * 3)

fun f_iter(n) =
    let
        fun f_iter(n, sum) =
            if n < 3 then n + sum
                     else f_iter((n - 1), sum) +
                         (f_iter((n - 2), sum) * 2) +
                         (f_iter((n - 3), sum) * 3)
    in  f_iter(n, 0)
    end

