(*
author:   "Kevin C. Baird"
purpose:  "SICP in Erlang: Count the number of ways to make change"
*)

(*
  Naive copying of Erlang version to Standard ML
  TODO: hide cc and first_denomination functions, if idiomatic to do so
*)

(* Define the coinage set as a function. *)
fun first_denomination(kinds) =
  case kinds of 1 => 1
              | 2 => 5
              | 3 => 10
              | 4 => 25
              | _ => 50; (* use _ wildcard instead of 5 to suppress non-exhaustive warning *)

(*
  There is only one (empty) way to make change for no money at all.
  There is no way to make change when there are no coin types available.
  There is no way to make change for a negative amount of money.
  In all other cases, recurse
*)
fun cc(0, _) = 1
  | cc(_, 0) = 0
  | cc(amount, kinds_of_coins) =
    if amount < 0 then 0
                  else cc(amount, kinds_of_coins-1) +
                    cc(amount - first_denomination(kinds_of_coins), kinds_of_coins);

(* Assume US coinage (five types of coins), and call cc() function. *)
fun count_change(amount) = cc(amount, 5);

