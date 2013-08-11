
class Body
  mass: 5.97219e24
  radius: 6371

  constructor: (radius, period, mass) ->
    if radius != undefined
      this.radius = radius
      this.mass = mass ? 5.97219e24

root.Body = Body

