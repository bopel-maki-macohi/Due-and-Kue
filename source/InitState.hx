import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		#if SAVE_CLEAR
		Main.save.erase();
		#end

		if (Main.save.data.unlockedLevels == null)
			Main.save.data.unlockedLevels = [];

		trace('Save: ${Main.save.data}');
		FlxG.switchState(() -> new PlayState(Main.save.data?.lastLevel));
	}
}
