root = exports ? this

CAMERA_FOV = 75

scene = null
camera = null
renderer = null

wWidth = 0
wHeight = 0

cube = null

$ ->
  wWidth = window.innerWidth
  wHeight = window.innerHeight
  initGL()

  initScene()
  
  updateGL()

initGL = ->
  scene = new THREE.Scene()
  camera = new THREE.PerspectiveCamera( CAMERA_FOV, wWidth / wHeight, 0.1, 1000 )

  renderer = new THREE.WebGLRenderer()
  renderer.setSize(wWidth, wHeight)
  renderer.setClearColorHex( 0x000000, 1 )

  document.body.appendChild(renderer.domElement)

  window.onresize = windowResized


updateGL = ->
  requestAnimationFrame(updateGL)
  cube.rotation.x += 0.01
  cube.rotation.y += 0.01
  drawGL()


drawGL = ->
  renderer.render(scene, camera)


initScene = ->
  geometry = new THREE.CubeGeometry(1,1,1)
  material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } )
  cube = new THREE.Mesh( geometry, material )
  scene.add cube
  camera.position.z = 5

windowResized = ->
  wWidth = window.innerWidth
  wHeight = window.innerHeight
  camera.aspect = wWidth / wHeight
  renderer.setSize(wWidth, wHeight)
  camera.updateProjectionMatrix()


