package com.bitdecay.textpop.style;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenCallback;
import flixel.FlxObject;

interface Style {
	public function Stylize(obj:FlxObject):FlxTween;
}