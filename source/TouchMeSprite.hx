import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSignal;

/**
	Seems like consent to me.
**/
class TouchMeSprite extends FlxSprite
{
	public var onClick:FlxSignal = new FlxSignal();

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this))
		{
			setColorTransform(1.5, 1.5, 1.5);
		}
		else
		{
			setColorTransform(1.0, 1.0, 1.0);
		}

		if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(this))
			onClick.dispatch();
	}

	public function addClickFunction(method:Void->Void):TouchMeSprite
	{
		onClick.add(method);

		return this;
	}
}
