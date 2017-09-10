package basicSetupAdapters;

import js.Browser;
import js.three.PerspectiveCamera;

class CameraAdapter {

    public var camera:PerspectiveCamera;

    public function new() {
        camera = new PerspectiveCamera(75, Browser.window.innerWidth / Browser.window.innerHeight, 0.1, 1000);
        camera.position.z = 3;

        Browser.window.addEventListener('resize', function() {
            camera.aspect = Browser.window.innerWidth / Browser.window.innerHeight;
            camera.updateProjectionMatrix();
        });
    }
}
