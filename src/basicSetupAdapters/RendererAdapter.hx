package basicSetupAdapters;

import js.Browser;
import js.three.WebGLRenderer;

class RendererAdapter {

    public var renderer:WebGLRenderer;


    public function new() {
        renderer = new WebGLRenderer();
        renderer.setSize(Browser.window.innerWidth, Browser.window.innerHeight);
        Browser.document.body.appendChild(renderer.domElement);

        Browser.window.addEventListener('resize', function() {
            renderer.setSize(Browser.window.innerWidth, Browser.window.innerHeight);

        });

    }
}
