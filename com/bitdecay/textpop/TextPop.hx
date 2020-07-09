package com.bitdecay.textpop;

import flixel.math.FlxPoint;
import flixel.util.FlxPool;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.FlxG;

import com.bitdecay.textpop.style.Style;
import com.bitdecay.textpop.style.builtin.FloatAway;

class TextPop {

	private static var pool:FlxPool<FlxText> = new FlxPool<FlxText>(FlxText);
	
	public static function pop(x:Int, y:Int, text:String, style:Style = null) {
		var obj = pool.get();
		obj.setPosition(x, y);
		obj.text = text;

		if (style == null) {
			style = new FloatAway(50, 1);
		}

		var tween = style.Stylize(obj);
		if (tween != null) {
			tween.onComplete = (t) -> FlxG.state.remove(obj);
		}

		FlxG.state.add(obj);
	}
}