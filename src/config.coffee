window.root = exports ? this

root.CAMERA_FOV = 75


root.wWidth = 0
root.wHeight = 0


startApp = ->
  root.wWidth = window.innerWidth
  root.wHeight = window.innerHeight
  initWindow()
  (new Application).main()

initWindow = ->
  $("html").css({ width: "100%", height: "100%", padding: "0", margin: "0", overflow: "hidden" })
  $("body").css({ width: "100%", height: "100%", padding: "0", margin: "0", overflow: "hidden" })
  $("canvas").css({ width: "100%", height: "100%", padding: "0", margin: "0" })


$ startApp

