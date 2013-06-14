(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.11 - define both recursive and iterative processes
*)

fun fRec(n) =
    case n < 3 of
        true => n
         | _ => fRec(n - 1) + (fRec(n - 2) * 2) + (fRec(n - 3) * 3)

fun fIter(n) =
    let
        fun fIter(n, sum) =
            case n < 3 of
                true => n + sum
                 | _ => fIter((n - 1), sum) +
                    (fIter((n - 2), sum) * 2) +
                    (fIter((n - 3), sum) * 3)
    in  fIter(n, 0)
    end

