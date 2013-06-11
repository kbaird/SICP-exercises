(*
Kevin C. Baird
SICP in Standard ML:
    Ackerman function
*)

fun ackerman(_, 0) = 0
  | ackerman(0, y) = y * 2
  | ackerman(_, 1) = 2
  | ackerman(x, y) = ackerman((x - 1), ackerman(x, (y - 1)))

(*
    ackerman(1, 10) = 1024
    ackerman(2, 4)  = 65536
    ackerman(3, 3)  = 65536
*)

fun f(n) = ackerman(0, n)
fun g(n) = ackerman(1, n)
fun h(n) = ackerman(2, n)

