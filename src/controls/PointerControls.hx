package controls;

import basicSetupAdapters.SceneAdapter;
import basicSetupAdapters.CameraAdapter;
import js.three.PointerLockControls;
import js.html.KeyboardEvent;
import js.Browser;
class PointerControls {

    public var controls:PointerLockControls = null;

    var moveUp:Bool = false;
    var moveDown:Bool = false;
    var moveLeft:Bool = false;
    var moveRight:Bool = false;

    public function new() {

    }

    public function setupContols(cameraAdapter:CameraAdapter, sceneAdapter:SceneAdapter) {
        controls = new PointerLockControls(cameraAdapter.camera);

        sceneAdapter.scene.add(controls.getObject());

        lockPointer();
        bindEvents();
    }

    function lockPointer() {
        Browser.document.body.addEventListener("click", function() {
            controls.enabled = true;
            var element = Browser.document.body;
            element.requestPointerLock();
        });
    }

    function bindEvents() {
        Browser.document.addEventListener('keydown', function(e:KeyboardEvent) {
            switch(e.key)
            {
                case Direction.ArrowUp | Direction.w:
                    moveUp = true;
                case Direction.ArrowDown | Direction.s:
                    moveDown = true;
                case Direction.ArrowLeft | Direction.a:
                    moveLeft = true;
                case Direction.ArrowRight | Direction.d:
                    moveRight = true;
            }

        }, false);

        Browser.document.addEventListener('keyup', function(e:KeyboardEvent) {
            switch(e.key)
            {
                case Direction.ArrowUp | Direction.w:
                    moveUp = false;
                case Direction.ArrowDown | Direction.s:
                    moveDown = false;
                case Direction.ArrowLeft | Direction.a:
                    moveLeft = false;
                case Direction.ArrowRight | Direction.d:
                    moveRight = false;
            }

        }, false);
    }

    public inline function handleMovement()
    {
        if (moveUp) {
            controls.getObject().translateZ(-0.4);
        }
        if (moveDown) {
            controls.getObject().translateZ(0.4);
        }
        if (moveLeft) {
            controls.getObject().translateX(-0.4);
        }
        if (moveRight) {
            controls.getObject().translateX(0.4);
        }
    }

}
