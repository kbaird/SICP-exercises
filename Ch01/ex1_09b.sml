(*
Kevin C. Baird
SICP in Standard ML:
    Add two positive integers, part II
*)

fun add(a, b) =
    let
        fun inc(x) = x + 1;
        fun dec(x) = x - 1;
    in
        if a = 0 then b
                 else add(dec(a), inc(b)) end

(*
    Follow the substitution model for add(4, 5)

    add(4, 5)
    add(dec(4), inc(5))
    add(3, 6)
    add(dec(3), inc(6))
    add(2, 7)
    add(dec(2), inc(7))
    add(1, 8)
    add(dec(1), inc(8))
    add(0, 9)
    9

9, via an iterative process
*)

