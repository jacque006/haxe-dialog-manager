package entities;

import behavior.tree.BTContext;
import behavior.tree.composite.Sequence;
import behavior.tree.decorator.Repeater;
import behavior.leaf.PlayerAlive;
import behavior.leaf.util.Wait;
import behavior.leaf.movement.ManhattanPath;
import behavior.leaf.TargetPlayer;
import behavior.tree.BTree;
import behavior.NavBundle;
import flixel.util.FlxPath;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import states.PlayState;

class Rat extends Enemy {
    var behavior:BTree;

	public function new(_parentState:PlayState, _player:Player, position:FlxPoint) {
        super(_parentState, _player, position);
        path = new FlxPath();
        speed = 30;

        behavior = new BTree(
            new Repeater(
                new Sequence([
                    new Wait(1, 3),
                    new PlayerAlive(
                        new TargetPlayer(
                            new ManhattanPath(speed)
                        )
                    )
                ])
            )
        );
        var context = new BTContext();
        context.set("player", player);
        context.set("enemy", this);
        context.set("navBundle", new NavBundle(parentState.currentLevel, player));
        behavior.init(context);


        super.loadGraphic(AssetPaths.rat__png, true, 16, 16);

        var animationSpeed:Int = 5;

        animation.add("walk_up", [7, 8], animationSpeed);
        animation.add("walk_right", [4, 5], animationSpeed);
        animation.add("walk_down", [1, 2], animationSpeed);
        animation.add("walk_left", [4, 5], animationSpeed);
        animation.add("stand_up", [6], animationSpeed);
        animation.add("stand_right", [3], animationSpeed);
        animation.add("stand_down", [0], animationSpeed);
        animation.add("stand_left", [3], animationSpeed);

        animation.play("stand_down");

        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);
    }

    override public function destroy() {
        FmodManager.PlaySoundOneShot(FmodSFX.RatDeath);
        kill();
    }

	override public function update(delta:Float):Void {
        super.update(delta);
        behavior.process(delta);

        if (inKnockback) {
            path.cancel();
        }

		if (!inKnockback) {
            if (velocity.x > 0){
                facing = FlxObject.RIGHT;
            } else if (velocity.x < 0) {
                facing = FlxObject.LEFT;
            } else if (velocity.y < 0) {
                facing = FlxObject.UP;
            } else if (velocity.y > 0) {
                facing = FlxObject.DOWN;
            }

			playAnimation(facing, velocity);
        }
    }

	function playAnimation(_facing:Int, _directionVector:FlxPoint){
        if (_directionVector == null || _directionVector.x == 0 && _directionVector.y == 0){
            switch _facing {
                case FlxObject.RIGHT:
                    animation.play("stand_right");
                case FlxObject.DOWN:
                    animation.play("stand_down");
                case FlxObject.LEFT:
                    animation.play("stand_left");
                case FlxObject.UP:
                    animation.play("stand_up");
            }
        } else {
            switch _facing {
                case FlxObject.RIGHT:
                    animation.play("walk_right", animation.curAnim.curFrame);
                case FlxObject.DOWN:
                    animation.play("walk_down", animation.curAnim.curFrame);
                case FlxObject.LEFT:
                    animation.play("walk_left", animation.curAnim.curFrame);
                case FlxObject.UP:
                    animation.play("walk_up", animation.curAnim.curFrame);
            }
        }
    }
}