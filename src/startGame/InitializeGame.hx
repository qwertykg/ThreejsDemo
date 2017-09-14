package startGame;

import Date;
import js.three.Vector3;
import js.three.Raycaster;
import controls.Direction;
import js.html.KeyboardEvent;
import js.Browser;
import js.three.PointerLockControls;
import js.three.Mesh;
import basicSetupAdapters.CameraAdapter;
import basicSetupAdapters.RendererAdapter;
import basicSetupAdapters.SceneAdapter;

class InitializeGame {

    var sceneAdapter:SceneAdapter;
    var rendererAdapter:RendererAdapter;
    var cameraAdapter:CameraAdapter;

    var moveUp:Bool = false;
    var moveDown:Bool = false;
    var moveLeft:Bool = false;
    var moveRight:Bool = false;

    var moving = false;

    var currentX:Float = 0;
    var currentZ:Float = 3;

    var controls:PointerLockControls;

    var speed = 1;

    var prevTime = Date.now().getSeconds();

    var raycaster:Raycaster;

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

        raycaster = new Raycaster( new Vector3(), new Vector3(0, -1, 0), 0, 10 );
        setupContols();

        renderLoop(0.01);
    }

    function setupContols() {
        controls = new PointerLockControls(cameraAdapter.camera);
        controls.getObject().position.set(currentX, 0, currentZ);
        sceneAdapter.scene.add(controls.getObject());

        bindEvents();
    }

    function bindEvents() {
        Browser.document.addEventListener('keydown', function(e:KeyboardEvent) {
            moving = true;
            switch(e.key)
            {
                case Direction.ArrowUp:
                    moveUp = true;
                case Direction.ArrowDown:
                    moveDown = true;
                case Direction.ArrowLeft:
                    moveLeft = true;
                case Direction.ArrowRight:
                    moveRight = true;
            }

        }, false);

        Browser.document.addEventListener('keyup', function(e:KeyboardEvent) {
            moving = false;
            switch(e.key)
            {
                case Direction.ArrowUp:
                    moveUp = false;
                case Direction.ArrowDown:
                    moveDown = false;
                case Direction.ArrowLeft:
                    moveLeft = false;
                case Direction.ArrowRight:
                    moveRight = false;
            }

        }, false);
    }

    function renderLoop(rotation:Float) {
        Browser.window.requestAnimationFrame(renderLoop);


        if (moving) {
            raycaster.ray.origin.copy(controls.getObject().position);
            raycaster.ray.origin.y -= 10;


            var time = Date.now().getSeconds();
            var delta = ( time - prevTime ) / 1000;

            currentX -= currentX * 10.0 * delta;
            currentZ -= currentZ * 10.0 * delta;

            if (moveUp) {
                currentZ -= 400.0 * delta;
            }
            if (moveDown) {
                currentZ += 400.0 * delta;
            }
            if (moveLeft) {
                currentX -= 400.0 * delta;
            }
            if (moveRight) {
                currentX += 400.0 * delta;
            }

            controls.getObject().position.set(currentX, 0, currentZ);
            prevTime = time;
        }

        rotateObject(object);
        rendererAdapter.renderer.render(sceneAdapter.scene, cameraAdapter.camera);
    }

    function rotateObject(object:Mesh) {
        object.rotation.x += 0.01;
        object.rotation.y += 0.05;
    }
}
