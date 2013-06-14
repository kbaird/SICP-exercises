(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.11 - define both recursive and iterative processes
*)

fun fRec(n) =
    if n < 3 then n
             else fRec(n - 1) +
                 (fRec(n - 2) * 2) +
                 (fRec(n - 3) * 3)

fun fIter(n) =
    let
        fun fIter(n, sum) =
            if n < 3 then n + sum
                     else fIter((n - 1), sum) +
                         (fIter((n - 2), sum) * 2) +
                         (fIter((n - 3), sum) * 3)
    in  fIter(n, 0)
    end

