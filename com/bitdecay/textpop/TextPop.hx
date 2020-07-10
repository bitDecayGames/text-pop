package com.bitdecay.textpop;

import flixel.FlxBasic;
import flixel.math.FlxPoint;
import flixel.util.FlxPool;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.FlxG;

import com.bitdecay.textpop.style.Style;
import com.bitdecay.textpop.style.builtin.FloatAway;

class TextPop extends FlxBasic {

	private static var pool:FlxPool<Instance> = new FlxPool<Instance>(Instance);
	
	public static function pop(x:Int, y:Int, text:String, style:Style = null, size:Int = 8) {
		var obj = pool.get();
		obj.size = size;
		obj.setPosition(x, y);
		obj.text = text;
		obj.alpha = 1;


		if (style == null) {
			style = new FloatAway(50, 1);
		}

		var tween = style.Stylize(obj);
		if (tween != null) {
			tween.onComplete = (t) -> {
				FlxG.state.remove(obj);
				pool.put(obj);
			}
		}

		FlxG.state.add(obj);
	}

	override public function destroy() {
		super.destroy();
		for (instance in pool.clear()) {
			instance.fullDestroy();
		}
	}
}