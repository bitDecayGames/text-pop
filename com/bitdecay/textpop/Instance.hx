package com.bitdecay.textpop;

import flixel.text.FlxText;

class Instance extends FlxText {
	public function new() {
		super("");
	}

	override public function destroy() {
		// we don't want these getting destroyed as part of the pool
	}

	public function fullDestroy() {
		super.destroy();
	}
}