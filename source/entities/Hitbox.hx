package entities;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxSprite;

class Hitbox extends FlxSprite {

    var timeActive:Float;

    public function new(_timeActive:Float, _position:FlxPoint, _size:FlxPoint) {
        super(_position.x, _position.y);
        timeActive = _timeActive;
        makeGraphic(Std.int(_size.x), Std.int(_size.y), new FlxColor(0xFF220000));
    }

    override public function update(delta:Float):Void {
        timeActive -= delta;
        if (timeActive <= 0) {
            destroy();
        }
    }

}