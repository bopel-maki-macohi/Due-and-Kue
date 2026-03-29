import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{

    override function create() {
        super.create();

		#if SAVE_CLEAR
		Main.save.erase();
		#end

        FlxG.switchState(() -> new PlayState(Main.save.data?.lastLevel));
    }
    
}