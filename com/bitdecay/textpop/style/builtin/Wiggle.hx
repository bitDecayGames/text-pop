package com.bitdecay.textpop.style.builtin;

import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;

class Wiggle implements Style {
	private var dist:Float;
	private var cycleTime:Float;

	public function new(dist:Float, cycleTime:Float) {
		this.dist = dist;
		this.cycleTime = cycleTime;
	}

	public function Stylize(obj:FlxObject):FlxTween {
		var flxObj:FlxObject = obj;
		return FlxTween.tween(obj, { x: flxObj.x + dist}, cycleTime, {
			type: FlxTweenType.PINGPONG,
			ease: FlxEase.sineInOut
		});
	}
}