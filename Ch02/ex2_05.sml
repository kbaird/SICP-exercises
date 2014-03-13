(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.4 - cons, car, cdr
*)

(*
fun extract encoded candidate base =
  case encoded mod base of
       0 => extract (encoded / base), (candidate + 1), base
     | _ => candidate
     *)

fun cons x y =
    let
        val newX = Math.pow(2.0,Real.fromInt(x):real)
        val newY = Math.pow(3.0,Real.fromInt(y):real)
    in
        round(newX * newY)
    end

fun car z =
  let
    fun innerCar(z, cand) =
      case (z mod 2) of
           0 => innerCar((z div 2), (cand + 1))
         | _ => cand
  in
    innerCar(z, 0)
end

fun cdr z =
  let
    fun innerCdr(z, cand) =
      case (z mod 3) of
           0 => innerCdr((z div 3), (cand + 1))
         | _ => cand
  in
    innerCdr(z, 0)
end

val l = cons 1 2

val x = 1
val newX = Math.pow(2.0,Real.fromInt(x):real)
val y = 2
val newY = Math.pow(3.0,Real.fromInt(y):real)
val product = newX * newY
val l2 = round(product)

val a = car l
val b = cdr l
