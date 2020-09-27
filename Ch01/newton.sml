(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.1.7 - Calculate square roots using Newton's method.
*)

fun sqrt(x) =
    let
        fun square(x)            = x * x
        val tolerance            = 0.001
        fun average(x, y)        = (x + y) / 2.0
        fun distance(guess, x)   = abs(square(guess) - x)
        fun goodEnough(guess, x) = distance(guess, x) < tolerance
        fun improve(guess, x)    = average(guess, (x/guess))
        fun sqrt(guess, x)       =
            case goodEnough(guess, x) of
                true => guess
                 | _ => sqrt(improve(guess, x), x)
    in  sqrt(1.0, x)
    end

