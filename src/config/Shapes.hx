package config;

@:enum abstract Shapes(String) from String to String {

    var Box = "Box";
    var Circle = "Circle";
    var Cone = "Cone";
    var Cylinder = "Cylinder";
    var Dodecahedron = "Dodecahedron";
    var Icosahedron = "Icosahedron";
    var Torus = "Torus";
}