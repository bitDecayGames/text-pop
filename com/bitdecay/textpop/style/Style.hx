package com.bitdecay.textpop.style;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenCallback;

interface Style {
	public function Stylize(obj:Dynamic):FlxTween;
}