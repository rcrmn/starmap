
class Starmap

  cube: null

  initScene: ->
    scene = Application.getInstance().scene

    geometry = new THREE.CubeGeometry(1,1,1)
    material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } )
    this.cube = new THREE.Mesh( geometry, material )
    scene.add this.cube

  updateScene: ->
    scene = Application.getInstance().scene

    cube = this.cube
    cube.rotation.x += 0.01
    cube.rotation.y += 0.01
    
  
root.Starmap = Starmap
