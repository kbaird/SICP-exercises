(*
Kevin C. Baird
SICP in Standard ML:
  Count the number of ways to make change
*)

(* Assume US coinage (five types of coins), and call countChange() function. *)
fun countChange amount =
    let
        fun firstDenomination(kinds) = (* Define the coinage set as a hidden function. *)
            case kinds of 1 => 1
                        | 2 => 5
                        | 3 => 10
                        | 4 => 25
                        | 5 => 50
                        | _ => 0

        fun countChange(0, _) = 1 (* 1 (empty) way to make change for no money at all. *)
          | countChange(_, 0) = 0 (* No way to make change when there are no coin types. *)
          | countChange(amt, coinTypes) =
            case amt < 0 of true => 0 (* No way to make change for a negative amount. *)
                             | _ =>   (* In all other cases, recurse *)
                let
                    val reducedAmt       = amt - firstDenomination(coinTypes)
                    val reducedResults   = countChange(reducedAmt, coinTypes)
                    val withoutFirstCoin = countChange(amt, coinTypes-1)
                in  reducedResults + withoutFirstCoin
                end

    in  countChange(amount, 5)
    end
