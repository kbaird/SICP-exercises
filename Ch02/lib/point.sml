signature POINT = sig
    type point
    val x:     point -> real
    val y:     point -> real
    val make': {x:real, y:real} -> point
end

structure Point : POINT = struct
    type point = real * real

    fun x(x, _) = x
    fun y(_, y) = y

    fun make' {x=x, y=y} = (x, y) : point
end

