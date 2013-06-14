(*
Kevin C. Baird
SICP in Standard ML:
    Redefine tolerance to vary based on the guess,
    rather than being a constant value.
*)

fun sqrt(x) =
    let
        fun average(x, y)        = (x + y) / 2.0;
        fun square(x)            = x * x;
        fun tolerance(x)         = x * 0.001;
        fun goodEnough(guess, x) = Real.abs(square(guess) - x) < tolerance(x);
        fun improve(guess, x)    = average(guess, x/guess);
        fun sqrt(guess, x) =
            if goodEnough(guess, x) then guess
                                    else sqrt(improve(guess, x), x);
    in  sqrt(1.0, x)
    end

