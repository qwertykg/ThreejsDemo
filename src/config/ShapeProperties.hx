package config;

typedef ShapeProperties =
{
    var shape:String;
    @:optional var width:Float;
    @:optional var height:Float;
    @:optional var depth:Float;
    @:optional var widthSegments:Float;
    @:optional var heightSegments:Float;
    @:optional var depthSegments:Float;

    @:optional var radius:Float;
    @:optional var segments:Int;
    @:optional var thethaStart:Float;
    @:optional var thethaEnd:Float;

    @:optional var radiusSegments:Float;
    @:optional var openEnded:Bool;
    @:optional var thethaLength:Float;

    @:optional var radiusTop:Float;
    @:optional var radiusBottom:Float;

    @:optional var detail:Float;

    @:optional var tube:Float;
    @:optional var radialSegments:Int;
    @:optional var tubialSegments:Int;
    @:optional var arc:Float;


}

