package com.bitdecay.textpop.style.builtin;

import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;

class FloatAway implements Style {
	private var height:Float;
	private var life:Float;

	public function new(height:Float, life:Float = 1.0) {
		this.height = height;
		this.life = life;
	}

	public function Stylize(obj:Dynamic):FlxTween {
		if (Std.is(obj, FlxObject)) {
			var flxObj:FlxObject = obj;
			var tween = FlxTween.tween(flxObj, { y: flxObj.y - height, alpha: 0}, life);
			return tween;
		}
		return null;
	}
}