(*
Kevin C. Baird
SICP in Standard ML:
  Count the number of ways to make change
*)

local

  fun first_denomination(kinds) = (* Define the coinage set as a hidden function. *)
    case kinds of 1 => 1
                | 2 => 5
                | 3 => 10
                | 4 => 25
                | 5 => 50
                | _ => 0;

  fun cc(0, _) = 1 (* There is only one (empty) way to make change for no money at all. *)
    | cc(_, 0) = 0 (* There is no way to make change when there are no coin types available. *)
    | cc(amt, coin_types) =
      if amt < 0 then 0 (* There is no way to make change for a negative amount of money. *)
      else              (* In all other cases, recurse *)
        let
          val reduced_amt      = amt - first_denomination(coin_types)
          val reduced_results  = cc(reduced_amt, coin_types)
          val without_1st_coin = cc(amt, coin_types-1)
        in
          reduced_results + without_1st_coin
        end

in

(* Assume US coinage (five types of coins), and call cc() function. *)
  fun count_change(amount) = cc(amount, 5);

end
