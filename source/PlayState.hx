package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public static var SEEN_CUTSCENES:Array<Int> = [];

	public var level:Int = 0;

	override public function new(level:Int = 1)
	{
		super();

		this.level = level;

		if (this.level < 1)
			this.level = 1;
	}

	override public function create()
	{
		super.create();
		due = new FlxSprite(0, 0, 'assets/images/play/due.png');
		add(due);

		due.screenCenter();

		if (level == 1)
		{
			if (!SEEN_CUTSCENES.contains(level))
				FlxG.switchState(() -> new DialogueState(level));
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public var due:FlxSprite;
}
