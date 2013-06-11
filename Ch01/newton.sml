(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 1.1.7 - Calculate square roots using Newton's method.
*)

fun sqrt(x) =
    let
        fun square(x)             = x * x
        val tolerance             = 0.001
        fun average(x, y)         = (x + y) / 2.0
        fun good_enough(guess, x) = abs(square(guess) - x) < tolerance
        fun improve(guess, x)     = average(guess, (x/guess))
        fun sqrt(guess, x) =
            if good_enough(guess, x) then guess
                                     else sqrt(improve(guess, x), x)
    in
        sqrt(1.0, x)
    end

