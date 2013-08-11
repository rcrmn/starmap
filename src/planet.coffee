
class Planet extends Body
  constructor: (radius, period, color, orbit) ->
    if period == undefined
      super()
    else
      super(radius, period)
    @color = color ? 0x8be7ff
    @orbit = orbit ? new Orbit


root.Planet = Planet

