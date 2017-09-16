package startGame;

import controls.PointerControls;
import js.Browser;
import Date;
import js.three.Vector3;
import js.three.Mesh;
import basicSetupAdapters.CameraAdapter;
import basicSetupAdapters.RendererAdapter;
import basicSetupAdapters.SceneAdapter;

class InitializeGame {

    var sceneAdapter:SceneAdapter;
    var rendererAdapter:RendererAdapter;
    var cameraAdapter:CameraAdapter;

    var currentX:Float = 0;
    var currentZ:Float = 3;

    var speed = 1;
    var velocity = new Vector3();

    var prevTime:Float;

    var controlsAdapter:PointerControls = null;

    var object:Mesh = null;
    var ground:Mesh = null;

    public function new() {

        prevTime = Date.now().getSeconds();
        sceneAdapter = new SceneAdapter();
        rendererAdapter = new RendererAdapter();
        cameraAdapter = new CameraAdapter();

        object = sceneAdapter.addMesh(
            {
                shape:"Box",
                width:1,
                height:1,
                depth:1,
                radius:0.4,
                detail:4,
                segments:100,
                openEnded:false,
                radiusTop:1,
                radiusBottom:1,
                tube:0.2,
                radialSegments:100,
                tubialSegments:100,
                x:0,
                y:4,
                z:0
            },
            "crate.jpg"
        );

        ground = sceneAdapter.addMesh(
            {
                shape:"Plane",
                width:1000,
                height:1000,
                widthSegments:10,
                heightSegments:10
            },
            "floor.jpg"
        );

        controlsAdapter = new PointerControls();
        controlsAdapter.setupContols(cameraAdapter, sceneAdapter);

        controlsAdapter.controls.getObject().position.set(currentX, 4, currentZ);

        renderLoop(0.01);
    }

    function renderLoop(rotation:Float) {

        Browser.window.requestAnimationFrame(renderLoop);

        controlsAdapter.handleMovement();

        rotateObject(object);
        rendererAdapter.renderer.render(sceneAdapter.scene, cameraAdapter.camera);
    }

    function rotateObject(object:Mesh) {
        object.rotation.x += 0.01;
        object.rotation.y += 0.05;
    }
}
