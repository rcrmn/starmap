
class Application
  
  instance = null

  @getInstance: (updater) ->
    instance ?= new ProtectedApplication(updater)

class ProtectedApplication
  scene: null
  camera: null
  renderer: null

  sceneUpdater: null

  constructor: (updater) ->
    this.sceneUpdater = updater

  main: ->
    this.initGL()

    this.initScene()
   
    this.updateGL()
    
  initGL: ->
    scene = new THREE.Scene()
    this.scene = scene

    camera = new THREE.PerspectiveCamera( CAMERA_FOV, wWidth / wHeight, 0.1, 1000 )
    this.camera = camera

    renderer = new THREE.WebGLRenderer()
    renderer.setSize(wWidth, wHeight)
    renderer.setClearColor( new THREE.Color(0x000000, 1 ) )

    document.body.appendChild(renderer.domElement)
    this.renderer = renderer

    window.onresize = this.windowResized


  initScene: ->
    this.sceneUpdater.initScene(this.scene)
    this.camera.position.z = 5

  windowResized: =>
    camera = this.camera
    renderer = this.renderer
    wWidth = window.innerWidth
    wHeight = window.innerHeight
    camera.aspect = wWidth / wHeight
    renderer.setSize(wWidth, wHeight)
    camera.updateProjectionMatrix()


  updateGL: =>
    this.sceneUpdater.updateScene(this.scene)

    requestAnimationFrame(this.updateGL)
    this.drawGL()


  drawGL: ->
    this.renderer.render(this.scene, this.camera)

root.Application = Application

