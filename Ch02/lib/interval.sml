signature INTERVAL = sig
    type interval
    val add:    interval * interval -> interval
    val divide: interval * interval -> interval
    val mult:   interval * interval -> interval
    val sub:    interval * interval -> interval
    val lower:  interval -> real
    val upper:  interval -> real
    val width:  interval -> real
    val make:   real * real -> interval
end

structure Interval : INTERVAL = struct
    type interval = real * real

    fun make(l, u) = (l, u) : interval

    fun lower(l, _)  = l
    fun upper(_, u)  = u

    fun add(i1, i2)  =
        let
            val newL = lower(i1) + lower(i2)
            val newU = upper(i1) + upper(i2)
        in  (newL, newU) : interval
        end

    fun mult(i1, i2)  =
        let
            val l1   = lower(i1)
            val l2   = lower(i2)
            val u1   = upper(i1)
            val u2   = upper(i2)
            val p1   = l1 * l2
            val p2   = l1 * u2
            val p3   = u1 * l2
            val p4   = u1 * u2
            fun minL [] = raise Empty
              | minL [h]    = h
              | minL (h::t) = if h < (minL t) then h else (minL t)
            fun maxL [] = raise Empty
              | maxL [h]    = h
              | maxL (h::t) = if h < (maxL t) then h else (maxL t)
            val newL = minL [p1, p2, p3, p4]
            val newU = maxL [p1, p2, p3, p4]
        in  (newL, newU) : interval
        end

    fun divide(i1, i2)  =
        let
            val recipL = (1.0 / lower(i2))
            val recipU = (1.0 / upper(i2))
            val recip  = make(recipL, recipU)
            val prod   = mult(i1, recip)
            val newL   = lower(prod)
            val newU   = upper(prod)
        in  (newL, newU) : interval
        end

    fun sub(i1, i2)  =
        let
            val newL = lower(i1) - lower(i2)
            val newU = upper(i1) - upper(i2)
        in  (newL, newU) : interval
        end

    fun width(i)  = (upper(i) - lower(i)) / 2.0

end

