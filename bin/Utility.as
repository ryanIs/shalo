package bin
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


		public static function _2DArrayNullFill(array:Array):Array
		{
			for(var i:Number = 0; i < array.length; i++)
			{
				for(var j:Number = 0; j < array[i]; j++)
				{
					array[i][j] = null;
				}
			}
			return array;
		}
	}
}