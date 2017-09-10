package startGame;

import js.three.Mesh;
import js.Browser;
import basicSetupAdapters.CameraAdapter;
import basicSetupAdapters.RendererAdapter;
import basicSetupAdapters.SceneAdapter;

class InitializeGame {

    var sceneAdapter:SceneAdapter;
    var rendererAdapter:RendererAdapter;
    var cameraAdapter:CameraAdapter;

    var object:Mesh = null;

    public function new() {
        sceneAdapter = new SceneAdapter();
        rendererAdapter = new RendererAdapter();
        cameraAdapter = new CameraAdapter();

        object = sceneAdapter.addMesh(
            {
                shape:"Torus",
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
                tubialSegments:100
            },
            "crate.jpg"
        );

        renderLoop(0.01);
    }

    function renderLoop(rotation:Float) {
        Browser.window.requestAnimationFrame(renderLoop);
        rotateObject(object);
        rendererAdapter.renderer.render(sceneAdapter.scene, cameraAdapter.camera);
    }

    function rotateObject(object:Mesh) {
        object.rotation.x += 0.01;
        object.rotation.y += 0.05;
    }
}
