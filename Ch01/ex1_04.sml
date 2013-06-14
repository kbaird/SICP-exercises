(*
Kevin C. Baird
SICP in Standard ML:
  Demonstrate an operator that is a compound procedure
  (i.e., not known at compile time).
*)

fun aPlusAbsB(a, b) =
    let fun getOp(b) =
        let val add = fn(x, y)=>x+y
            val sub = fn(x, y)=>x-y
        in  case (b < 0) of
                true => sub
              | _    => add
        end
    in  getOp(b)(a, b)
    end
