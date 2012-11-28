(*
author:   "Kevin C. Baird"
purpose:  "SICP in Standard ML: Demonstrate an operator that is a compound procedure (i.e., not known at compile time)."
*)

fun a_plus_abs_b(a, b) =
  case (b < 0) of
      true => (fn(x, y)=>x-y)(a, b)
    | _    => (fn(x, y)=>x+y)(a, b);
