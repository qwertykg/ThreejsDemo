package basicSetupAdapters;

import js.three.Vector3;
import js.Three;
import js.three.PlaneGeometry;
import js.three.Geometry;
import js.three.MeshBasicMaterial;
import js.three.TorusGeometry;
import js.three.IcosahedronGeometry;
import js.three.DodecahedronGeometry;
import js.three.CylinderGeometry;
import js.three.ConeGeometry;
import js.three.CircleGeometry;
import config.Shapes;
import config.ShapeProperties;
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

    public function addMesh(properties:ShapeProperties, ?texture:String):Mesh {

        var shapeObject:Geometry;
        var texture = new TextureLoader().load('art/$texture');

        switch(properties.shape)
        {
            case Shapes.Box:
                shapeObject = new BoxGeometry(properties.width, properties.height, properties.depth);

            case Shapes.Circle:
                shapeObject = new CircleGeometry(properties.radius, properties.segments);

            case Shapes.Cone:
                shapeObject = new ConeGeometry(properties.radius, properties.height, properties.radiusSegments, properties.openEnded);

            case Shapes.Cylinder:
                shapeObject = new CylinderGeometry(properties.radiusTop, properties.radiusBottom, properties.height, properties.segments, properties.openEnded);

            case Shapes.Dodecahedron:
                shapeObject = new DodecahedronGeometry(properties.radius, properties.detail);

            case Shapes.Icosahedron:
                shapeObject = new IcosahedronGeometry(properties.radius, properties.detail);

            case Shapes.Torus:
                shapeObject = new TorusGeometry(properties.radius, properties.tube, properties.radialSegments, properties.tubialSegments, properties.arc);

            case Shapes.Plane:
                texture.wrapS = Three.RepeatWrapping;
                texture.wrapT = Three.RepeatWrapping;
                texture.repeat.set(100, 100);

                shapeObject = new PlaneGeometry( properties.width, properties.height, properties.widthSegments, properties.heightSegments );
                shapeObject.rotateX(-Math.PI / 2);

            default:
                shapeObject = new BoxGeometry(1, 1, 1);
        }


        var material = new MeshLambertMaterial({
            map: texture
        });

        var shapeMesh:Mesh = new Mesh(shapeObject, material);

        if(Reflect.hasField(properties,"x") || Reflect.hasField(properties,"y") || Reflect.hasField(properties,"z"))
        {
            shapeMesh.translateX(properties.x);
            shapeMesh.translateY(properties.y);
            shapeMesh.translateZ(properties.z);
        }

        scene.add(shapeMesh);

        return shapeMesh;
    }
}
