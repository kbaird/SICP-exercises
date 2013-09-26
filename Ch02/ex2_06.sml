(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.4 - cons, car, cdr
*)

fun churchEncode n =
let
  fun innerEncode(f, n, x) =
    case n of 0 => x
            | _ => innerEncode(f, (n-1), x)
in
  fn f => (fn x => (innerEncode(f, n, x)))
end

val zero = churchEncode 0
val one  = churchEncode 1
