(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.4 - cons, car, cdr
*)

fun cons x y = fn m => m x y

fun car z = z (fn (p, _) => p)
fun cdr z = z (fn (_, q) => q)
