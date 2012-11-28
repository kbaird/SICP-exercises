(*
author:   "Kevin C. Baird"
purpose:  "SICP in Standard ML: Demonstrate an operator that is a compound procedure (i.e., not known at compile time)."
*)

local

  fun get_op(b) =
    let
      val add = fn(x, y)=>x+y
      val sub = fn(x, y)=>x-y
    in
      case (b < 0) of
        true => sub
      | _    => add
    end;

in

  fun a_plus_abs_b(a, b) = get_op(b)(a, b);

end
