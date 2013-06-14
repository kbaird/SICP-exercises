(*
Kevin C. Baird
SICP in Standard ML:
    Calculate cube roots using Newton's method.
*)

fun cbrt(x) =
    let
        fun square(x)            = x * x;
        fun cube(x)              = x * x * x;
        val tolerance            = 0.001;
        fun goodEnough(guess, x) = (Real.abs(cube(guess) - x) < tolerance);
        fun improve(guess, x)    = (x / (square(guess)) + (2.0 * guess)) / 3.0;
        fun cbrt(guess, x) =
            case goodEnough(guess, x) of
                true => guess
                 | _ => cbrt(improve(guess, x), x);
    in  cbrt(1.0, x)
    end

