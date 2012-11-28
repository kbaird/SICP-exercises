(*
author:   "Kevin C. Baird"
purpose:  "SICP in Standard ML: Count the number of ways to make change"
*)

local

  (* Define the coinage set as a hidden function. *)
  fun first_denomination(kinds) =
    case kinds of 1 => 1
                | 2 => 5
                | 3 => 10
                | 4 => 25
                | 5 => 50
                | _ => 0;

  (* There is only one (empty) way to make change for no money at all. *)
  fun cc(0, _) = 1
    (* There is no way to make change when there are no coin types available. *)
    | cc(_, 0) = 0
    | cc(amount, kinds_of_coins) =
    (* There is no way to make change for a negative amount of money. *)
      if amount < 0 then 0
                    else
                      (* In all other cases, recurse *)
                      cc(amount, kinds_of_coins-1) +
                      cc(amount - first_denomination(kinds_of_coins), kinds_of_coins);

in

(* Assume US coinage (five types of coins), and call cc() function. *)
  fun count_change(amount) = cc(amount, 5);

end
