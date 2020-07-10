package com.bitdecay.textpop.style.builtin;

import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;

enum JumpDirection {
	LEFT;
	RIGHT;
}

class JumpAway implements Style {
	private var distance:Float;
	private var height:Float;
	private var dir:JumpDirection;
	private var time:Float;

	public function new(distance:Float, height:Float, dir:JumpDirection = RIGHT, time:Float) {
		this.distance = Math.abs(distance);
		this.height = Math.abs(height);
		this.dir = dir;
		this.time = time;
	}

	public function Stylize(obj:FlxObject):FlxTween {
		var flxObj:FlxObject = obj;
		var xJump:Float = 50;
		if (dir == LEFT) {
			xJump = distance * -1;
		}
		var startY = flxObj.y;
		FlxTween.tween(flxObj, {x: flxObj.x + xJump}, time);
		var up = FlxTween.tween(flxObj, { y: startY - height}, time / 2,
			{ ease: FlxEase.sineOut});
		var down = FlxTween.tween(flxObj,
			{
				y: startY,
				alpha: 0
			}, time / 2,
			{ ease: FlxEase.sineIn});
		up.then(down);
		return down;
	}
}