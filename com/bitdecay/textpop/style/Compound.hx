package com.bitdecay.textpop.style;

import flixel.tweens.FlxTween;
import flixel.FlxObject;

// A way of combining styles, using the last provided style as the marker
// for when the style is finished. Note that strange interactions may occur
// between tweens if they both attempt to modify the same properties on the
// object
class Compound implements Style {
	private var styles:Array<Style>;

	public function new(styles:Array<Style>) {
		this.styles = styles;
	}

	public function Stylize(obj:FlxObject):FlxTween {
		var tweens:Array<FlxTween> = [];
		for (i in 0...styles.length) {
			tweens.push(styles[i].Stylize(obj));
		}

		if (tweens.length == 0) {
			return null;
		}

		// Ensure that we cancel all tweens once our last tween finishes
		tweens[tweens.length-1].onComplete = (t) -> {
			for (tween in tweens) {
				tween.cancel();
			}
		}

		// Hand back a no-op empty tween so our onComplete doesn't get overwritten
		var finalTween = FlxTween.tween(obj, {}, 0);
		tweens[tweens.length-1].then(finalTween);

		return finalTween;
	}
}