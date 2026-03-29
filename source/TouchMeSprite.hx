import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSignal;

/**
	Seems like consent to me.
**/
class TouchMeSprite extends FlxSprite
{
	public var onClick:FlxTypedSignal<TouchMeSprite->Void> = new FlxTypedSignal<TouchMeSprite->Void>();

	public var overlap:FlxTypedSignal<TouchMeSprite->Void> = new FlxTypedSignal<TouchMeSprite->Void>();
	public var nonoverlap:FlxTypedSignal<TouchMeSprite->Void> = new FlxTypedSignal<TouchMeSprite->Void>();

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this))
		{
			setColorTransform(1.5, 1.5, 1.5);
			overlap.dispatch(this);
		}
		else
		{
			setColorTransform(1.0, 1.0, 1.0);
			nonoverlap.dispatch(this);
		}

		if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(this))
			onClick.dispatch(this);
	}

	public function addClickFunction(method:TouchMeSprite->Void):TouchMeSprite
	{
		onClick.add(method);

		return this;
	}

	public function addOverlapFunction(method:TouchMeSprite->Void):TouchMeSprite
	{
		overlap.add(method);

		return this;
	}

	public function addNonoverlapFunction(method:TouchMeSprite->Void):TouchMeSprite
	{
		nonoverlap.add(method);

		return this;
	}
}
