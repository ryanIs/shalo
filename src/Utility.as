package src
{
	import flash.display.MovieClip;

	/*
		Utility functions
	*/
	public class Utility
	{
		public static function tileModifier(movieClip:MovieClip, obj:Object):MovieClip
		{
			if(obj["rotate"] != undefined)
			{
				movieClip.rotation = obj["rotate"];
			}

			return movieClip;
		}
	}
}