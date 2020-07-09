package com.bitdecay.textpop.style;

import flixel.tweens.FlxTween;

// A way of combining styles, using the last provided style as the marker
// for when the style is finished. Note that strange interactions may occur
// between tweens if they both attempt to modify the same properties on the
// object
class Compound implements Style {
	private var styles:Array<Style>;

	public function new(styles:Array<Style>) {
		this.styles = styles;
	}

	public function Stylize(obj:Dynamic):FlxTween {
		var tween:FlxTween;
		for (i in 0...styles.length) {
			tween = styles[i].Stylize(obj);
			if (i == styles.length-1) {
				return tween;
			}
		}

		return null;
	}
}