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

    var cube:Mesh = null;

    public function new()
    {
        sceneAdapter = new SceneAdapter();
        rendererAdapter = new RendererAdapter();
        cameraAdapter = new CameraAdapter();

        cube = sceneAdapter.addTexturedCube();

        renderLoop(0.01);
    }

    function renderLoop(rotation:Float) {
        Browser.window.requestAnimationFrame(renderLoop);
        rotateCube(cube);
        rendererAdapter.renderer.render(sceneAdapter.scene, cameraAdapter.camera);
    }

    function rotateCube(cube:Mesh) {
        cube.rotation.x += 0.01;
        cube.rotation.y += 0.05;
    }
}
