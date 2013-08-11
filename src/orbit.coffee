
class Orbit
  e: 0.01671123
  a: 149598261
  i: 1.57869
  o: 348.73936
  p: 114.20783
  m: 357.51716
  epoch: 2000
  n: 0

  @calculate_mean_motion: (m1, m2, axis) ->
    Math.sqrt((m1 + m2)*root.G / (axis*axis*axis))

  constructor: (e, a, i, o, p, m, epoch, n ) ->
    if e != undefined
      @e = e
      @a = a
      @i = i
      @o = o
      @p = p
      @m = m
      @epoch = epoch
      @n = n
    else
      @a = 149598261
      @n = Math.sqrt((5.97219e24 + 1.9891e30)*root.G / (@a*@a*@a))

  get_position: (time) ->
    t = time - @epoch
    m = @m + @n * t

    # todo: acabar de fer el càlcul
    y = 0
    x = Math.sin(m) * @a
    z = Math.cos(m) * @a

    {x: x, y: y, z: z}

root.Orbit = Orbit

