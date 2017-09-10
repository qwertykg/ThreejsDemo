package basicSetupAdapters;

import js.three.Mesh;
import js.three.MeshFaceMaterial;
import js.three.TextureLoader;
import js.three.MeshLambertMaterial;
import js.three.BoxGeometry;
import js.three.DirectionalLight;
import js.three.AmbientLight;
import js.three.Scene;

class SceneAdapter {

    public var scene:Scene;

    public function new() {
        scene = new Scene();

        var ambientLight = new AmbientLight(0xFFFFFF, 1);
        scene.add(ambientLight);

        var directionalLight = new DirectionalLight(0xFFFFFF, 1.5);
        directionalLight.position.set(0, 1, 0);
        scene.add(directionalLight);
    }

    public function addTexturedCube():Mesh
    {
        var shape = new BoxGeometry(1, 1, 1);

        var cubeMaterial = [
            new MeshLambertMaterial({
                map: new TextureLoader().load("art/crate.jpg")
            }),
            new MeshLambertMaterial({
                map: new TextureLoader().load("art/crate.jpg")
            }),
            new MeshLambertMaterial({
                map: new TextureLoader().load("art/crate.jpg")
            }),
            new MeshLambertMaterial({
                map: new TextureLoader().load("art/crate.jpg")
            }),
            new MeshLambertMaterial({
                map: new TextureLoader().load("art/crate.jpg")
            }),
            new MeshLambertMaterial({
                map: new TextureLoader().load("art/crate.jpg")
            })
        ];

        var material = new MeshFaceMaterial(cubeMaterial);

        var cube = new Mesh(shape, material);
        scene.add(cube);

        return cube;
    }
}
